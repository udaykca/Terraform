provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "tenable_key" {
  name = "tenable-secret-key"
}

locals {
  # 3 us-east-1a AZ, 1 us-east-1b
  private_subnets = ["subnet-xxxxxxxx"]
  public_subnets  = ["subnet-xxxxxxxx"]
}

module "k8s-cluster" {
  source = "<source of terrafrm modules >"

  k8s_version            = "1.24"
  organization           = "org_name"   
  environment            = "test"
  suffix                 = 0
  vpc_id                 = "vpc-xxxx"
  endpoint_public_access = "true"
  subnet_ids             = concat(local.private_subnets, local.public_subnets)
  tags = {
    team         = "test"
    owner        = "test-ops"
  }
  key_pair_name             = "xxxx"
  k8s_log_retention_in_days = 7
  nodegroups                = var.nodegroups
  iam_roles_with_policies   = merge(var.iam_roles_with_policies, var.alb_role_polices)

  tennable_secret_key = data.aws_ssm_parameter.tenable_key.value
  tennable_group      = "aws_k8s_dev"
}
