module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name            = "${local.name}-${var.vpc_name}"
  cidr            = var.vpc_cidr_block
  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets  = var.web_subnets
  private_subnets = var.app_subnets
  intra_subnets   = var.reserved_subnets

  database_subnets                   = var.vpc_database_subnets
  create_database_subnet_group       = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  enable_nat_gateway = var.vpc_enable_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_ipv6                                    = true
  assign_ipv6_address_on_creation                = true
  private_subnet_assign_ipv6_address_on_creation = false

  public_subnet_ipv6_prefixes   = [3, 7, 11]
  private_subnet_ipv6_prefixes  = [2, 6, 10]
  database_subnet_ipv6_prefixes = [1, 5, 9]
  intra_subnet_ipv6_prefixes    = [0, 4, 8]

  tags = local.common_tags

  public_subnet_tags = {
    Type = "Web Subnets"
  }
  private_subnet_tags = {
    Type = "App Subnets"
  }
  database_subnet_tags = {
    Type = "Database Subnets"
  }
  intra_subnet_tags = {
    Type = "Reserved Subnets"
  }
}