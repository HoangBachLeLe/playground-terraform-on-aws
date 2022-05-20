### Terraform on AWS: multi-tier VPC subnets

| Name          | CIDR           | AZ |
| ------------- | -------------- | -- |
| sn-reserved-A | 10.16.0.0/20   | A  |
| sn-db-A       | 10.16.16.0/20  | A  |
| sn-app-A      | 10.16.32.0/20  | A  |
| sn-web-A      | 10.16.48.0/20  | A  |
| sn-reserved-B | 10.16.64.0/20  | B  |
| sn-db-B       | 10.16.80.0/20  | B  |
| sn-app-B      | 10.16.96.0/20  | B  |
| sn-web-B      | 10.16.112.0/20 | B  |
| sn-reserved-C | 10.16.128.0/20 | C  |
| sn-db-C       | 10.16.144.0/20 | C  |
| sn-app-C      | 10.16.160.0/20 | C  |
| sn-web-C      | 10.16.176.0/20 | C  |