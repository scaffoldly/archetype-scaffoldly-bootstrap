{{ hash-banner }}

module "aws_serverless_api_{{ service_name }}" {
  source  = "scaffoldly/serverless-api/aws"
  version = "1.0.29"

  repository_name    = "{{ repository-name }}"
  api_gateway_stages = module.bootstrap_aws.api_gateway_stages
  path               = "{{ path }}"

  kms_stages = module.bootstrap_aws.kms_stages

  depends_on = [
    module.bootstrap_aws
  ]
}

output "{{ repository-name }}_stage_config_aws" {
  value = module.aws_serverless_api_{{ service_name }}.stage_config
}

output "{{ repository-name }}_deployer_credentials_aws" {
  value     = module.aws_serverless_api_{{ service_name }}.deployer_credentials
  sensitive = true
}
