##########################################################
#  Resultado do request IP Address - Lista
##########################################################
locals {
  remote_address = jsondecode(data.http.ip_address.response_body)
}
##########################################################
#  Lista vpc_cidr_blocks
##########################################################
locals {
  vpc_cidr_blocks = "${local.vpc_cidr_pref}${".0.0/16"}"
}
##########################################################
#  Lista vpc_azs_avaliable
##########################################################
locals {
  vpc_azs_avaliable = [
    "${local.region}a",
    "${local.region}b",
    "${local.region}c",
    "${local.region}d",
    "${local.region}e",
    "${local.region}f",
  ]
}
##########################################################
#  Lista vpc_public_subnet_cidr_blocks
##########################################################
locals {
  vpc_public_subnet_cidr_blocks = [
    "${local.vpc_cidr_pref}${".1.0/24"}",
    "${local.vpc_cidr_pref}${".2.0/24"}",
    "${local.vpc_cidr_pref}${".3.0/24"}",
    "${local.vpc_cidr_pref}${".4.0/24"}",
    "${local.vpc_cidr_pref}${".5.0/24"}",
    "${local.vpc_cidr_pref}${".6.0/24"}",
    "${local.vpc_cidr_pref}${".7.0/24"}",
    "${local.vpc_cidr_pref}${".8.0/24"}"
  ]
}
##########################################################
#  Lista vpc_private_subnet_cidr_blocks
##########################################################
locals {
  vpc_private_subnet_cidr_blocks = [
    "${local.vpc_cidr_pref}${".101.0/24"}",
    "${local.vpc_cidr_pref}${".102.0/24"}",
    "${local.vpc_cidr_pref}${".103.0/24"}",
    "${local.vpc_cidr_pref}${".104.0/24"}",
    "${local.vpc_cidr_pref}${".105.0/24"}",
    "${local.vpc_cidr_pref}${".106.0/24"}",
    "${local.vpc_cidr_pref}${".107.0/24"}",
    "${local.vpc_cidr_pref}${".108.0/24"}"
  ]
}
##########################################################
#  Lista security_groups_zabbix_ids
##########################################################
locals {
  security_groups_zabbix_ids = [
    # Selecionar os security groups zabbix
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_8080.id,
    aws_security_group.sg_port_zabbix.id,
    aws_security_group.sg_rds_mysql.id,
  ]
}
##########################################################
#  Lista security_groups_web_ids
##########################################################
locals {
  security_groups_web_ids = [
    # Selecionar os security groups web
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_80.id,
    aws_security_group.sg_port_443.id,
  ]
}
##########################################################
#  Lista instancia_zabbix_output
##########################################################
locals {
  instancia_zabbix_output = {
    for i, aws_instance in aws_instance.zabbix-server : "zabbix-server-${i + 1}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2_zabbix_server.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
      tag               = local.ec2_zabbix_server.tag_name
    }
  }
}
##########################################################
#  Lista instancia_web_output
##########################################################
locals {
  instancia_web_output = {
    for i, aws_instance in aws_instance.web : "web-${i + 1}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2_web.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
      tag               = local.ec2_web.tag_name
    }
  }
}
##########################################################
# Gerar index ps de acordo com a quant. de instancias
##########################################################
locals {
  index_psz = [for i in range(local.ec2_zabbix_count) : i % length(module.vpc.public_subnets[*]) + 1]
  index_psw = [for i in range(local.ec2_web_count) : i % length(module.vpc.public_subnets[*]) + 1]
}
##########################################################
# Gerar lista com base index -> motivo balanciar instancias em zonas diferentes automaticamente
##########################################################
locals {
  pub_subnet_ids = {
    zabbix = [
      for i in local.index_psz : element(module.vpc.public_subnets[*], i - 1)
    ]
    web = [
      for i in local.index_psw : element(module.vpc.public_subnets[*], i - 1)
    ]
  }
}
##########################################################