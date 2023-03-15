# New product object for product teams to authenticate in Vault. Also contains the name of the machine user, the name of the secret engine and the Kubernetes secret with which the ArgoCD Vault Plugin can authenticate to resolve secret variables.
# 
# product_teams = {
# "<new-vault-object-for-new-product-team>" : {
#   name : "<new-vault-product-name>"
#   secret_engine_name : "<new-vault-secret-engine-for-new-product>"
#   ui_policy_name : "<new-vault-product-ui-permissions-for-vault-default-rw>"
#   approle_name : "<new-vault-app-role-name>"
#   approle_policy_name : "<new-vault-product-technical-permissions-for-vault-default-ro>"
#   github_team : "<new-product-team-gh-team-name>"
#   avp_secret_name : "<new-argocd-vault-plugin-sercret-for-new-product-team>"
# },

product_teams = {
  # "example" : {
  #   name : "product-team-example"
  #   secret_engine_name : "product-team-example"
  #   ui_policy_name : "product-team-example-rw"
  #   approle_name : "product-team-example"
  #   approle_policy_name : "product-team-example-ro"
  #   avp_secret_name : "example"
  #   github_team : "product-team-example"
  # },
  # "puris" : {
  #   name : "puris",
  #   secret_engine_name : "puris"
  #   ui_policy_name : "puris-rw"
  #   approle_name : "puris"
  #   approle_policy_name : "puris-ro"
  #   avp_secret_name : "puris"
  #   github_team : "product-puris"
  # },
  # "edc" : {
  #   name : "edc",
  #   secret_engine_name : "edc"
  #   ui_policy_name : "edc-rw"
  #   approle_name : "edc"
  #   approle_policy_name : "edc-ro"
  #   avp_secret_name : "edc"
  #   github_team : "product-edc"
  # },
  "bpdm" : {
    name : "bpdm",
    secret_engine_name : "bpdm"
    ui_policy_name : "bpdm-rw"
    approle_name : "bpdm"
    approle_policy_name : "bpdm-ro"
    github_team : "BPDM"
    github_team_slug : "bpdm"
    avp_secret_name : "bpdm"
  },
  # "catenax-at-home" : {
  #   name : "catenax-at-home"
  #   secret_engine_name : "catenax-at-home"
  #   ui_policy_name : "catenax-at-home-rw"
  #   approle_name : "catenax-at-home"
  #   approle_policy_name : "catenax-at-home-ro"
  #   github_team : "product-catenax-at-home"
  #   avp_secret_name : "catenax-at-home"
  # },
  # "data-integrity-demonstrator" : {
  #   name : "data-integrity-demonstrator"
  #   secret_engine_name : "data-integrity-demonstrator"
  #   ui_policy_name : "data-integrity-demonstrator-rw"
  #   approle_name : "data-integrity-demonstrator"
  #   approle_policy_name : "data-integrity-demonstrator-ro"
  #   github_team : "product-data-integrity-demonstrator"
  #   avp_secret_name : "data-integrity-demonstrator"
  # },
  # "dft" : {
  #   name : "dft",
  #   secret_engine_name : "dft"
  #   ui_policy_name : "dft-rw"
  #   approle_name : "dft"
  #   approle_policy_name : "dft-ro"
  #   github_team : "product-dft"
  #   avp_secret_name : "dft"
  # },
  # "esc-backbone" : {
  #   name : "esc-backbone",
  #   secret_engine_name : "esc-backbone"
  #   ui_policy_name : "esc-backbone-rw"
  #   approle_name : "esc-backbone"
  #   approle_policy_name : "esc-backbone-ro"
  #   github_team : "product-esc-backbone"
  #   avp_secret_name : "esc-backbone"
  # },
  "essential-services" : {
    name : "essential-services",
    secret_engine_name : "essential-services"
    ui_policy_name : "essential-services-rw"
    approle_name : "essential-services"
    approle_policy_name : "essential-services-ro"
    github_team : "SD-Factory"
    github_team_slug : "sd-factory"
    avp_secret_name : "essential-services"
  },
  # "explorer" : {
  #   name : "explorer",
  #   secret_engine_name : "explorer"
  #   ui_policy_name : "explorer-rw"
  #   approle_name : "explorer"
  #   approle_policy_name : "explorer-ro"
  #   github_team : "product-explorer"
  #   avp_secret_name : "product-explorer"
  # },
  # "innovation-radar" : {
  #   name : "innovation-radar",
  #   secret_engine_name : "innovation-radar"
  #   ui_policy_name : "innovation-radar-rw"
  #   approle_name : "innovation-radar"
  #   approle_policy_name : "innovation-radar-ro"
  #   github_team : "product-innovation-radar"
  #   avp_secret_name : "innovation-radar"
  # },
  "managed-identity-wallets" : {
    name : "managed-identity-wallets"
    secret_engine_name : "managed-identity-wallets"
    ui_policy_name : "managed-identity-wallets-rw"
    approle_name : "managed-identity-wallets"
    approle_policy_name : "managed-identity-wallets-ro"
    github_team : "MIW"
    github_team_slug : "miw"
    avp_secret_name : "managed-identity-wallets"
  },
  # "material-pass" : {
  #   name : "material-pass",
  #   secret_engine_name : "material-pass"
  #   ui_policy_name : "material-pass-rw"
  #   approle_name : "material-pass"
  #   approle_policy_name : "material-pass-ro"
  #   github_team : "product-material-pass"
  #   avp_secret_name : "material-pass"
  # },
  "portal" : {
    name : "portal",
    secret_engine_name : "portal"
    ui_policy_name : "portal-rw"
    approle_name : "portal"
    approle_policy_name : "portal-ro"
    github_team : "Portal Backend"
    github_team_slug : "portal-backend"
    avp_secret_name : "portal"
  },
  # "traceability-irs" : {
  #   name : "traceability-irs",
  #   # product- prefix does not comply with naming convention but is already in use
  #   secret_engine_name : "traceability-irs" # traceability-irs also exists without any secret
  #   ui_policy_name : "traceability-irs-rw"  # remove product- prefix
  #   approle_name : "traceability-irs"
  #   approle_policy_name : "traceability-irs-ro"
  #   github_team : "product-traceability-irs"
  #   avp_secret_name : "traceablity-irs" # TYPO, but this is the secret that is used also in argo...
  # },
  "semantics" : {
    name : "semantics",
    secret_engine_name : "semantics"
    ui_policy_name : "semantics-rw"
    approle_name : "semantics"
    approle_policy_name : "semantics-ro"
    github_team : "Semantic hub"
    github_team_slug : "semantic-hub"
    avp_secret_name : "semantics"
  },
  # "test-data-generator" : {
  #   name : "test-data-generator",
  #   secret_engine_name : "test-data-generator"
  #   ui_policy_name : "test-data-generator-rw"
  #   approle_name : "test-data-generator"
  #   approle_policy_name : "test-data-generator-ro"
  #   github_team : "product-test-data-generator"
  #   avp_secret_name : "test-data-generator"
  # },
  # "traceability-foss" : {
  #   name : "traceability-foss",
  #   secret_engine_name : "traceability-foss"
  #   ui_policy_name : "traceability-foss-rw"
  #   approle_name : "traceability-foss" # traceability-foss-backend also exists
  #   approle_policy_name : "traceability-foss-ro"
  #   github_team : "product-traceability-foss"
  #   avp_secret_name : "traceability-foss" # product-traceability-foss also exists
  # },
  # "behaviour-twin-pilot" : {
  #   name : "behaviour-twin-pilot"
  #   secret_engine_name : "behaviour-twin-pilot"
  #   ui_policy_name : "behaviour-twin-pilot-rw"
  #   approle_name : "behaviour-twin-pilot"
  #   approle_policy_name : "behaviour-twin-pilot-ro"
  #   github_team : "product-behaviour-twin-pilot"
  #   avp_secret_name : "behaviour-twin-pilot"
  # },
  # "value-added-service" : {
  #   name : "value-added-service"
  #   secret_engine_name : "value-added-service"
  #   ui_policy_name : "value-added-service-rw"
  #   approle_name : "value-added-service"
  #   approle_policy_name : "value-added-service-ro"
  #   github_team : "product-value-added-service"
  #   avp_secret_name : "value-added-service"
  # },
  # "knowledge" : {
  #   name : "knowledge",
  #   secret_engine_name : "knowledge"
  #   ui_policy_name : "knowledge-rw"
  #   approle_name : "knowledge"
  #   approle_policy_name : "knowledge-ro"
  #   github_team : "product-knowledge"
  #   avp_secret_name : "knowledge"
  # },
  "registry-twin-check" : {
    name : "registry-twin-check",
    secret_engine_name : "registry-twin-check"
    ui_policy_name : "registry-twin-check-rw"
    approle_name : "registry-twin-check"
    approle_policy_name : "registry-twin-check-ro"
    github_team : "product-registry-twin-check"
    avp_secret_name : "registry-twin-check"
  },
  # "business-partner-certificates" : {
  #   name : "business-partner-certificates",
  #   secret_engine_name : "business-partner-certificates"
  #   ui_policy_name : "business-partner-certificates-rw"
  #   approle_name : "business-partner-certificates"
  #   approle_policy_name : "business-partner-certificates-ro"
  #   github_team : "product-business-partner-certificates"
  #   avp_secret_name : "business-partner-certificates"
  # },
  # "et-demonstrators" : {
  #   name : "et-demonstrators",
  #   secret_engine_name : "et-demonstrators"
  #   ui_policy_name : "et-demonstrators-rw"
  #   approle_name : "et-demonstrators"
  #   approle_policy_name : "et-demonstrators-ro"
  #   github_team : "product-et-demonstrators"
  #   avp_secret_name : "et-demonstrators"
  # },
  # "item-relationship-service-frontend" : {
  #   name : "item-relationship-service-frontend",
  #   secret_engine_name : "item-relationship-service-frontend"
  #   ui_policy_name : "item-relationship-service-frontend-rw"
  #   approle_name : "item-relationship-service-frontend"
  #   approle_policy_name : "item-relationship-service-frontend-ro"
  #   github_team : "product-item-relationship-service-frontend"
  #   avp_secret_name : "item-relationship-service-frontend"
  # },
  # "r-strategy-assistant" : {
  #   name : "r-strategy-assistant",
  #   secret_engine_name : "r-strategy-assistant"
  #   ui_policy_name : "r-strategy-assistant-rw"
  #   approle_name : "r-strategy-assistant"
  #   approle_policy_name : "r-strategy-assistant-ro"
  #   github_team : "product-r-strategy-assistant"
  #   avp_secret_name : "r-strategy-assistant"
  # }
}
