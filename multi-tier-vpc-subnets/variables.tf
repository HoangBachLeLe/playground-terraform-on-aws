variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "business_divsion" {
  type    = string
  default = "HR"
}

locals {
  owners      = var.business_divsion
  environment = var.environment
  name        = "${var.business_divsion}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
  }
} 