vpc_name                               = "demo-vpc"
vpc_cidr_block                         = "10.16.0.0/16"
web_subnets                            = ["10.16.48.0/20", "10.16.112.0/20", "10.16.176.0/20"]
app_subnets                            = ["10.16.32.0/20", "10.16.96.0/20", "10.16.160.0/20"]
vpc_database_subnets                   = ["10.16.16.0/20", "10.16.80.0/20", "10.16.144.0/20"]
reserved_subnets                       = ["10.16.0.0/20", "10.16.64.0/20", "10.16.128.0/20"]
vpc_create_database_subnet_group       = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway                 = true