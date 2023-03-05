terraform {
  backend "s3" {
    bucket = "terraform-state-zabbix" # Trocar aqui
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}