##########################################################
locals {
  vpc-cidr-blocks = "${local.vpc-cidr-pref}${".0.0/16"}"
}
##########################################################
locals {
  vpc-azs-avaliable = [
    "${local.regiao-aws}a",
    "${local.regiao-aws}b",
    "${local.regiao-aws}c",
    "${local.regiao-aws}d",
    "${local.regiao-aws}e",
    "${local.regiao-aws}f",
  ]
}
##########################################################
locals {
  vpc-public-subnet-cidr-blocks = [
    "${local.vpc-cidr-pref}${".1.0/24"}",
    "${local.vpc-cidr-pref}${".2.0/24"}",
    "${local.vpc-cidr-pref}${".3.0/24"}",
    "${local.vpc-cidr-pref}${".4.0/24"}",
    "${local.vpc-cidr-pref}${".5.0/24"}",
    "${local.vpc-cidr-pref}${".6.0/24"}",
    "${local.vpc-cidr-pref}${".7.0/24"}",
    "${local.vpc-cidr-pref}${".8.0/24"}"
  ]
}
##########################################################
locals {
  vpc-private-subnet-cidr-blocks = [
    "${local.vpc-cidr-pref}${".101.0/24"}",
    "${local.vpc-cidr-pref}${".102.0/24"}",
    "${local.vpc-cidr-pref}${".103.0/24"}",
    "${local.vpc-cidr-pref}${".104.0/24"}",
    "${local.vpc-cidr-pref}${".105.0/24"}",
    "${local.vpc-cidr-pref}${".106.0/24"}",
    "${local.vpc-cidr-pref}${".107.0/24"}",
    "${local.vpc-cidr-pref}${".108.0/24"}"
  ]
}
##########################################################
locals {
  security-groups-zabbix-ids = [
    # Selecionar os security groups zabbix
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_8080.id,
    aws_security_group.sg_port_zabbix.id,
    aws_security_group.sg_rds_mysql.id,
  ]
}
##########################################################
locals {
  security-groups-web-ids = [
    # Selecionar os security groups web
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_80.id,
    aws_security_group.sg_port_443.id,
  ]
}
##########################################################
locals {
  instancia_zabbix_output = {
    for i, aws_instance in aws_instance.zabbix-server : "zabbix-server-${i + 1}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2-zabbix-server.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
    }
  }
}
##########################################################
locals {
  instancia_web_output = {
    for i, aws_instance in aws_instance.web : "web-${i + 1}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2-web.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
    }
  }
}
##########################################################