##########################################################
#  Obs : 
#  Porta 22 por segurança definida somente para seu ip.
##########################################################
locals {
  region = "us-east-1"
}
##########################################################
#  Configuração VPC
##########################################################
locals {
  vpc_cidr_pref            = "10.1"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
}
##########################################################
#  Configuração Projeto
##########################################################
locals {
  projeto_name   = "zabbix" 
  zabbix_number  = 1
  web_number     = 2
  grafana_number = 1
  # Load Balancer -> Somente para instancias web 
  # Definir false caso não deseje criar o Load Balancer
  create_lb      = false
  # Definir false caso não deseje criar o RDS MYSQL
  create_rds     = true
}
##########################################################
#  Configuração Grupo Segurança - Somente para meu IP
##########################################################
locals {
  ingress_cidr_blocks_ip = {
    #  definir true somente para seu ip.
    port-80   = false
    port-443  = false
    port-8080 = true
    port-3000 = true
  }
}
##########################################################
#  Configuração do RDS MYSQL
##########################################################
locals {
  rds_mysql = {
    # Definir como true se deseja criar o recurso.
    create                = local.create_rds
    identifier            = "rds-mysql-${local.projeto_name}"
    username              = "admin"     # Trocar aqui
    password              = "admin1234" # Trocar aqui
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
    # Informar a qtd de intancia desejada
    count               = local.zabbix_number
    ami                 = data.aws_ami.ubuntu-22
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    sg_ids              = [
      # Selecionar os security groups zabbix
      aws_security_group.sg_ssh.id,
      aws_security_group.sg_port_8080.id,
      aws_security_group.sg_port_zabbix.id,
      aws_security_group.sg_rds_mysql.id,
    ]
    tag_name = "${local.projeto_name}-server"
  }
}
##########################################################
#  Configuração da instancia WEB
##########################################################
locals {
  ec2_web = {
    # Informar a qtd de intancia desejada
    count               = local.web_number
    ami                 = data.aws_ami.amazon-linux-2
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    sg_ids = [
      # Selecionar os security groups web
      aws_security_group.sg_ssh.id,
      aws_security_group.sg_port_80.id,
      aws_security_group.sg_port_443.id,
    ]
    tag_name = "web"
  }
}
##########################################################
#  Configuração da instancia Grafana
##########################################################
locals {
  ec2_grafana = {
    # Informar a qtd de intancia desejada
    count               = local.grafana_number
    ami                 = data.aws_ami.ubuntu-22
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    sg_ids = [
      # Selecionar os security groups grafana
      aws_security_group.sg_ssh.id,
      aws_security_group.sg_port_3000.id,
    ]
    tag_name = "grafana"
  }
}
##########################################################