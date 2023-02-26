##########################################################
resource "aws_security_group" "sg_port_80" {
  description = "Acesso a porta 80"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_80"
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
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
resource "aws_security_group" "sg_port_8080" {
  description = "Acesso a porta 8080"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_8080"
  ingress {
    protocol    = "tcp"
    from_port   = 8080
    to_port     = 8080
    cidr_blocks = ["0.0.0.0/0"]
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
resource "aws_security_group" "sg_port_443" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_443"
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
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
resource "aws_security_group" "sg_ssh" {
  description = "Acesso a porta 22"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_ssh"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["${local.ip_address.ip}/32"]
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
resource "aws_security_group" "sg_rds_mysql" {
  description = "Acesso a rds mysql"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_rds_mysql"
  ingress {
    protocol    = "tcp"
    from_port   = 3306
    to_port     = 3306
    cidr_blocks = ["${local.sg_cidr_blocks}"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0", ]
  }
  tags = {
    Name = "terraform_mysql"
  }
}
##########################################################
resource "aws_security_group" "sg_port_zabbix" {
  description = "Acesso a porta 443"
  vpc_id      = module.vpc.vpc_id
  name        = "sg_port_zabbix"
  ingress {
    protocol    = "tcp"
    from_port   = 1050
    to_port     = 1051
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
