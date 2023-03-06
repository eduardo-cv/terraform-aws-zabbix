##########################################################
terraform {
  required_version = ">= 1.3.9"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.45.0"
    }
    http = ">= 3.2.1"
  }
  # Remote-State
  backend "s3" {
    region  = "us-east-1"
    bucket  = "terraform-state-zabbix" # Trocar aqui
    key     = "dev/v3/zabbix-rds-aws/terraform.tfstate"
    encrypt = true
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
# terraform fmt -recursive
# terraform show