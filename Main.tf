##########################################################

# Lab Zabbix - UBUNTU 22 com RDS

##########################################################
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45.0"
    }
    http = ">= 3.2.1"
  }
}
##########################################################
provider "aws" {
  region = local.region
}
##########################################################

# terraform init
# terraform apply --auto-approve
# terraform destroy --auto-approve
# terraform show