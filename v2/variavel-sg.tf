##########################################################
locals {
  sg_cidr_blocks = local.vpc_cidr_blocks
}
##########################################################
locals {
  security_groups_zabbix = [
    # Selecionar os security groups zabbix
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_8080.id,
    aws_security_group.sg_port_zabbix.id,
    aws_security_group.sg_rds_mysql.id,
  ]
}
##########################################################
locals {
  security_groups_web = [
    # Selecionar os security groups web
    aws_security_group.sg_ssh.id,
    aws_security_group.sg_port_80.id,
    aws_security_group.sg_port_443.id,
  ]
}
##########################################################