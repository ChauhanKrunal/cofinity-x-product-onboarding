##
#   auth related resources
##

resource "vault_github_auth_backend" "github_login" {
  organization = "Cofinity-X"

  tune {
    listing_visibility = "unauth"
    token_type         = "default-service"
    max_lease_ttl      = "768h"
    default_lease_ttl  = "768h"
  }
}

resource "vault_auth_backend" "approle" {
  type = "approle"
}

resource "vault_auth_backend" "token-auth-backend" {
  type        = "token"
  description = "token based credentials"
  tune {
    listing_visibility = "unauth"
  }
}

# VAULT OIDC Config + Role mapping to Github Teams
resource "vault_jwt_auth_backend" "oidc_auth_backend" {
  oidc_discovery_url = "https://dex.vault.cofinity-x.com"
  oidc_client_id     = var.vault_oidc_client_id
  oidc_client_secret = var.vault_oidc_client_secret
  bound_issuer       = "https://dex.vault.cofinity-x.com"
  description        = "Vault authentication method OIDC"
  path               = "oidc"
  type               = "oidc"

  tune {
    listing_visibility = "unauth"
    token_type         = "default-service"
    max_lease_ttl      = "768h"
    default_lease_ttl  = "768h"
  }
}

##
#   DevSecOps team related resources
##

resource "vault_mount" "devsecops_secret_engine" {
  path        = "devsecops"
  type        = "kv"
  description = "Secret engine for DevSecOps team"
  options     = {
    "version" = "2"
  }
}

resource "vault_policy" "vault_admin_policy" {
  name   = "vault_admins"
  policy = <<EOT
path "*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

resource "vault_github_team" "devsecops" {
  backend  = vault_github_auth_backend.github_login.id
  team     = "argocdadmins"
  policies = [vault_policy.vault_admin_policy.name]
}

resource "vault_jwt_auth_backend_role" "devsecops_oidc_role" {
  backend               = vault_jwt_auth_backend.oidc_auth_backend.path
  allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback", "https://vault.cofinity-x.com/ui/vault/auth/oidc/oidc/callback"
  ]
  role_type      = "oidc"
  user_claim     = "email"
  oidc_scopes    = ["openid", "email", "groups"]
  token_policies = [vault_policy.vault_admin_policy.name]
  role_name      = "devsecops-admins"
  bound_claims   = { "groups" : "Cofinity-X:argocdadmins" }
}

resource "vault_approle_auth_backend_role" "devsecops_approle" {
  backend        = vault_auth_backend.approle.path
  role_name      = "devsecops"
  token_policies = [vault_policy.vault_admin_policy.name]

  # values taken from the existing resources, while initially importing to the tf state
  secret_id_num_uses = 0
  secret_id_ttl      = 0
  token_max_ttl      = 1800
  token_num_uses     = 0
  token_ttl          = 1200
}

# # existing ones cannot be imported, so new ones will be created
resource "vault_approle_auth_backend_role_secret_id" "devsecops_approle_secret_id" {
  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.devsecops_approle.role_name

  # change will be done outside of terraform if not
  cidr_list = []
}

resource "vault_generic_secret" "devsecops_avp_secret" {
  path = "${vault_mount.devsecops_secret_engine.path}/avp-config/devsecops"

  data_json = <<EOT
{
  "role_id":   "${vault_approle_auth_backend_role.devsecops_approle.role_id}",
  "secret_id": "${vault_approle_auth_backend_role_secret_id.devsecops_approle_secret_id.secret_id}"
}
EOT
}

# ##
# #   product team related resources
# ##
resource "vault_mount" "product_team_secret_engines" {
  for_each = var.product_teams

  path        = each.value.secret_engine_name
  type        = "kv"
  description = "Secret engine for team ${each.value.name}"
  options     = {
    "version" = "2"
  }
}

resource "vault_policy" "product_team_policies" {
  for_each = var.product_teams

  name   = each.value.ui_policy_name
  policy = <<EOT
path "${each.value.secret_engine_name}/*" {
  capabilities = [ "create", "read", "update", "delete", "list" ]
}
EOT
}

# Need to create this for other envs /dev /int etc.
resource "vault_policy" "product_approle_read_only_policies" {
  for_each = var.product_teams

  name   = each.value.approle_policy_name
  policy = <<EOT
path "${each.value.secret_engine_name}/*" {
  capabilities = [ "read" ]
}
EOT
}

resource "vault_github_team" "github_product_teams" {
  for_each = var.product_teams

  backend  = vault_github_auth_backend.github_login.id
  team     = each.value.github_team
  policies = [each.value.ui_policy_name]
}

# ##
# #   product team approles
# ##

resource "vault_approle_auth_backend_role" "product_team_approles" {
  for_each = var.product_teams

  backend        = vault_auth_backend.approle.path
  role_name      = each.value.approle_name
  token_policies = [each.value.approle_policy_name]

  # values taken from the existing resources, while initially importing to the tf state
  secret_id_num_uses = 0
  secret_id_ttl      = 0
  token_max_ttl      = 1800
  token_num_uses     = 0
  token_ttl          = 1200
}

# # existing ones cannot be imported, so new ones will be created
resource "vault_approle_auth_backend_role_secret_id" "product_teams_approle_ids" {
  for_each = var.product_teams

  backend   = vault_auth_backend.approle.path
  role_name = vault_approle_auth_backend_role.product_team_approles[each.key].role_name

  # change will be done outside of terraform if not
  cidr_list = []
}

resource "vault_generic_secret" "product_team_avp_secrets" {
  for_each = var.product_teams

  path = "${vault_mount.devsecops_secret_engine.path}/avp-config/${each.value.avp_secret_name}"

  data_json = <<EOT
{
  "role_id":   "${vault_approle_auth_backend_role.product_team_approles[each.key].role_id}",
  "secret_id": "${vault_approle_auth_backend_role_secret_id.product_teams_approle_ids[each.key].secret_id}"
}
EOT
}

resource "vault_jwt_auth_backend_role" "oidc_auth_roles" {
  for_each = var.product_teams

  backend               = vault_jwt_auth_backend.oidc_auth_backend.path
  allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback", "https://vault.cofinity-x.com/ui/vault/auth/oidc/oidc/callback"
  ]
  role_type      = "oidc"
  user_claim     = "email"
  oidc_scopes    = ["openid", "email", "groups"]
  token_policies = [each.value.ui_policy_name]
  role_name      = each.value.github_team
  bound_claims   = { "groups" : "Cofinity-X:${each.value.github_team}" }
}
