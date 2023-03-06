##########################################################
#         EC2 instance - [zabbix-server]
##########################################################
resource "aws_instance" "zabbix-server" {
  count                  = local.ec2_zabbix_server.count
  ami                    = local.ec2_zabbix_server.ami.id
  instance_type          = local.ec2_zabbix_server.instance_type
  vpc_security_group_ids = local.security_groups_zabbix_ids
  subnet_id              = count.index == 0 ? module.vpc.public_subnets[0] : module.vpc.public_subnets[1]
  # subnet_id              = var.aws_private_subnet_ids[count.index % length(var.aws_private_subnet_ids)]


  associate_public_ip_address = local.ec2_zabbix_server.associate_public_ip
  key_name                    = local.ec2_zabbix_server.key_name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-zabbix.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_zabbix_server.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_zabbix_server.tag_name
  }
}
##########################################################
#               EC2 instance - [web]
##########################################################
resource "aws_instance" "web" {
  count                  = local.ec2_web.count
  ami                    = local.ec2_web.ami.id
  instance_type          = local.ec2_web.instance_type
  vpc_security_group_ids = local.security_groups_web_ids
  subnet_id              = count.index == 0 ? module.vpc.public_subnets[0] : module.vpc.public_subnets[1]
  # subnet_id              = var.aws_private_subnet_ids[count.index % length(var.aws_private_subnet_ids)]
  associate_public_ip_address = local.ec2_web.associate_public_ip
  key_name                    = local.ec2_web.key_name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-web.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_web.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_web.tag_name
  }
}
##########################################################