data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  name   = "ex-${basename(path.cwd)}"
  region = var.aws_region

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Example    = local.name
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]

  # Disabled NAT gateway to save a few seconds running this example
  enable_nat_gateway   = false
  enable_dns_hostnames = true

  tags = local.tags
}

module "alb" {
  source = "../modules/alb"
  vpc_id = module.vpc.vpc_id
  lb_name = "${local.name}-alb"
  lb_bucket_name = "testmassi24041990"
  subnets = module.vpc.public_subnets
  lb_security_group_name = "${local.name}-alb-sg"
  azs = local.azs
  desired_capacity = 3
  max_size = 3
  min_size = 1

}