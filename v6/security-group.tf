##########################################################
#  Grupo de Segurança -> 80
##########################################################
resource "aws_security_group" "sg_port_80" {
  description = "Acesso a porta 80"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_80"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = local.ingress_cidr_blocks_ip.port-80 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_80"
  }
}
##########################################################
#  Grupo de Segurança -> 8080
##########################################################
resource "aws_security_group" "sg_port_8080" {
  description = "Acesso a porta 8080"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_8080"
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = local.ingress_cidr_blocks_ip.port-8080 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_8080"
  }
}
##########################################################
#  Grupo de Segurança -> 443
##########################################################
resource "aws_security_group" "sg_port_443" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_443"
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = local.ingress_cidr_blocks_ip.port-443 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_443"
  }
}
##########################################################
#  Grupo de Segurança -> SSH
##########################################################
resource "aws_security_group" "sg_ssh" {
  description = "Acesso a porta 22"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_ssh"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${local.remote_address.ip}/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_ssh"
  }
}
##########################################################
#  Grupo de Segurança -> MYSQL
##########################################################
resource "aws_security_group" "sg_rds_mysql" {
  description = "Acesso a rds mysql"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_rds_mysql"
  ingress {
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["${local.vpc_cidr_blocks}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_sg_rds_mysql"
  }
}
##########################################################
#  Grupo de Segurança -> Zabbix
##########################################################
resource "aws_security_group" "sg_port_zabbix" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_zabbix"
  ingress {
    protocol    = "tcp"
    from_port   = 10050
    to_port     = 10051
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_zabbix"
  }
}
##########################################################
#  Grupo de Segurança -> 3000
##########################################################
resource "aws_security_group" "sg_port_3000" {
  description = "Acesso a porta 3000"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_3000"
  ingress {
    protocol    = "tcp"
    from_port   = 3000
    to_port     = 3000
    cidr_blocks = local.ingress_cidr_blocks_ip.port-3000 ? ["${local.remote_address.ip}/32"] : ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_port_3000"
  }
}
##########################################################