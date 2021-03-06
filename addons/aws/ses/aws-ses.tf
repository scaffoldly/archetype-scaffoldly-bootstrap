module "aws_ses" {
  source  = "scaffoldly/email/aws"
  version = "1.0.7"

  root_email = var.ROOT_EMAIL
  account_id = var.BOOTSTRAP_AWS_ACCOUNT_ID

  subdomain          = "slyses"
  api_gateway_stages = module.bootstrap_aws.api_gateway_stages

  providers = {
    aws.dns = aws.root
  }

  depends_on = [
    module.bootstrap_aws
  ]
}

output "bootstrap_aws_ses_mail_stages" {
  value = module.aws_ses.mail_stages
}
