##########################################################
//  Obs : 
//  Porta 8080 foi configurada somente para seu ip.
//  Porta 22 foi configurada somente para seu ip.
##########################################################
locals {
  region = "us-east-1"
  # Projeto
  projeto_name = "zabbix"
  # Config VPC
  vpc_cidr_pref            = "10.1"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
  # Criar RDS MYSQL
  create_rds_mysql = true
  #  Instances  
  ec2_zabbix_count = 1
  ec2_web_count    = 2
}
##########################################################
#  Load Balancer
##########################################################
variable "create_lb" {
  type = bool
  # Trocar abaixo para false se não quiser criar o load balancer.  
  default = true
}
##########################################################
#  Configuração do RDS MYSQL
##########################################################
locals {
  rds_mysql = {
    identifier            = "rds-mysql-${local.projeto_name}"
    username              = "admin"
    password              = "admin1234"
    instance_class        = "db.t3.micro"
    allocated_storage     = 20
    max_allocated_storage = 22
    availability_zones_db = "${local.region}a"
  }
}
##########################################################
#  Configuração da instancia Zabbix
##########################################################
locals {
  ec2_zabbix_server = {
    count               = local.ec2_zabbix_count
    ami                 = data.aws_ami.ubuntu-22
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    tag_name            = "${local.projeto_name}-server"
  }
}
##########################################################
#  Configuração da instancia WEB
##########################################################
locals {
  ec2_web = {
    count               = local.ec2_web_count
    ami                 = data.aws_ami.amazon-linux-2
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    tag_name            = "web"
  }
}
##########################################################