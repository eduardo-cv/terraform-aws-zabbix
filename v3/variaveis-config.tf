##########################################################
locals {
  regiao-aws = "us-east-2"
  # VPC  
  vpc-name                 = "vpc-zabbix"
  vpc-cidr-pref            = "10.1"
  vpc-azs-avaliable-count  = 2
  vpc-private-subnet-count = 2
  vpc-public-subnet-count  = 2
  vpc-enable-nat-gateway   = false # Colocar false pelo motivo de cobrança da aws
  #  Config.   
  criar-rds          = true
  criar-load-balance = false
  #  Quant.   
  ec2-zabbix-count = 2
  ec2-web-count    = 2
}
##########################################################
locals {
  rds-mysql = {
    identifier            = "rds-mysql-zabbix"
    username              = "admin"
    password              = "admin1234"
    instance_class        = "db.t3.micro"
    allocated_storage     = 20
    max_allocated_storage = 22
    avail_zones_db        = "${local.regiao-aws}a"
  }
}
##########################################################
locals {
  ec2-zabbix-server = {
    count         = local.ec2-zabbix-count
    ami           = data.aws_ami.ubuntu-22
    instance-type = "t2.micro"
    key-name      = var.ec2_key_par[local.regiao-aws]
    volume-size   = 8
    tag-name      = "zabbix-server"
  }
}
##########################################################
locals {
  ec2-web = {
    count         = local.ec2-web-count
    ami           = data.aws_ami.amazon-linux-2
    instance-type = "t2.micro"
    key-name      = var.ec2_key_par[local.regiao-aws]
    volume-size   = 8
    tag-name      = "web"
  }
}
##########################################################