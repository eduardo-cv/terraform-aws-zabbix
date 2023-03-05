locals {
  region                   = var.regiao["us-east-1"]
  vpc_name                 = "vpc-zabbix"
  vpc_cidr_pref            = "10.0"
  vpc_azs_avaliable_count  = 2
  vpc_private_subnet_count = 2
  vpc_public_subnet_count  = 2
  criar_rds                = true
}
##########################################################
locals {
  EC2_Instance_Zabbix = {
    Tag_Name               = "zabbix-server"
    Ami                    = data.aws_ami.ubuntu-22
    EC2_Instance_Type      = var.ec2_instance_type["t2.micro"]
    Instance_Vpc_Subnet_Id = module.vpc.public_subnets[0] # Subnet A
    Associate_Public_Ip    = true
    Security_Groups_Ids    = local.security_groups_zabbix
    File_User_Data         = "user-data-zabbix.sh"
    Volume_Size            = 8
  }
}
##########################################################
locals {
  EC2_Instance_Web_01 = {
    Tag_Name               = "web"
    Ami                    = data.aws_ami.amazon-linux-2
    EC2_Instance_Type      = var.ec2_instance_type["t2.micro"]
    Instance_Vpc_Subnet_Id = module.vpc.public_subnets[0] # Subnet A
    Associate_Public_Ip    = true
    Security_Groups_Ids    = local.security_groups_web
    File_User_Data         = "user-data-web.sh"
    Volume_Size            = 8
  }
}
##########################################################
locals {
  EC2_Instance_Web_02 = {
    Tag_Name               = "web"
    Ami                    = data.aws_ami.amazon-linux-2
    EC2_Instance_Type      = var.ec2_instance_type["t2.micro"]
    Instance_Vpc_Subnet_Id = module.vpc.public_subnets[1] # Subnet B
    Associate_Public_Ip    = true
    Security_Groups_Ids    = local.security_groups_web
    File_User_Data         = "user-data-web.sh"
    Volume_Size            = 8
  }
}
##########################################################
