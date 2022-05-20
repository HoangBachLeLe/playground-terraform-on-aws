output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "web_cidr" {
  value = concat(module.vpc.public_subnets_cidr_blocks, module.vpc.public_subnets_ipv6_cidr_blocks)
}

output "app_cidr" {
  value = concat(module.vpc.private_subnets_cidr_blocks, module.vpc.private_subnets_ipv6_cidr_blocks)
}

output "database_cidr" {
  value = concat(module.vpc.database_subnets_cidr_blocks, module.vpc.database_subnets_ipv6_cidr_blocks)
}

output "reserved_cidr" {
  value = concat(module.vpc.intra_subnets_cidr_blocks, module.vpc.intra_subnets_ipv6_cidr_blocks)
}

output "nat_public_ips" {
  value = module.vpc.nat_public_ips
}

output "azs" {
  value = module.vpc.azs
}