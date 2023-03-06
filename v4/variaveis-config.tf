##########################################################
locals {
  region = "us-east-1"
  # VPC  
  vpc_name                 = "zabbix"
  vpc_cidr_pref            = "10.1"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
  vpc_enable_nat_gateway   = false # Colocar false pelo motivo de cobrança da aws
  #  DB-RDS   
  criar_rds = true
  #  Load Balance
  criar_alb = true # Pendente arrumar validate
  alb_name  = "zabbix"
  #  Quant.   
  ec2_zabbix_count = 1
  ec2_web_count    = 2
}
##########################################################
locals {
  rds_mysql = {
    identifier            = "rds-mysql-zabbix"
    username              = "admin"
    password              = "admin1234"
    instance_class        = "db.t3.micro"
    allocated_storage     = 20
    max_allocated_storage = 22
    availability_zones_db = "${local.region}a"
  }
}
##########################################################
locals {
  ec2_zabbix_server = {
    count               = local.ec2_zabbix_count
    ami                 = data.aws_ami.ubuntu-22
    associate_public_ip = true
    instance_type       = "t2.micro"
    key_name            = var.ec2_key_par["${local.region}"]
    volume_size         = 8
    tag_name            = "zabbix-server"
  }
}
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