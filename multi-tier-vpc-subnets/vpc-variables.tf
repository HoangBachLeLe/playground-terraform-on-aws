variable "vpc_name" {
  type    = string
  default = "demo-vpc"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.16.0.0/16"
}

variable "web_subnets" {
  type    = list(string)
  default = ["10.16.48.0/20", "10.16.112.0/20", "10.16.176.0/20"]
}

# VPC Private Subnets
variable "app_subnets" {
  type    = list(string)
  default = ["10.16.32.0/20", "10.16.96.0/20", "10.16.160.0/20"]
}

variable "vpc_database_subnets" {
  type    = list(string)
  default = ["10.16.16.0/20", "10.16.80.0/20", "10.16.144.0/20"]
}

variable "reserved_subnets" {
  type    = list(string)
  default = ["10.16.0.0/20", "10.16.64.0/20", "10.16.128.0/20"]
}

variable "vpc_create_database_subnet_group" {
  type    = bool
  default = true
}

variable "vpc_create_database_subnet_route_table" {
  type    = bool
  default = true
}

variable "vpc_enable_nat_gateway" {
  type    = bool
  default = true
}