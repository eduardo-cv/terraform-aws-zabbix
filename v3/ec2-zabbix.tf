##########################################################
#         EC2 instance - [zabbix-server]
##########################################################
resource "aws_instance" "zabbix-server" {
  count                  = local.ec2-zabbix-server.count
  ami                    = local.ec2-zabbix-server.ami.id
  instance_type          = local.ec2-zabbix-server.instance-type
  vpc_security_group_ids = local.security-groups-zabbix-ids
  subnet_id              = count.index == 0 ? module.vpc.public_subnets[0] : module.vpc.public_subnets[1]
  key_name               = local.ec2-zabbix-server.key-name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-zabbix.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2-zabbix-server.volume-size
  }

  depends_on = [module.db[0].db_instance_endpoint]

  tags = {
    Name = local.ec2-zabbix-server.tag-name
  }
}
##########################################################
#               EC2 instance - [web]
##########################################################
resource "aws_instance" "web" {
  count                  = local.ec2-web.count
  ami                    = local.ec2-web.ami.id
  instance_type          = local.ec2-web.instance-type
  vpc_security_group_ids = local.security-groups-web-ids
  subnet_id              = count.index == 0 ? module.vpc.public_subnets[0] : module.vpc.public_subnets[1]
  key_name               = local.ec2-web.key-name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-web.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2-web.volume-size
  }

  tags = {
    Name = local.ec2-web.tag-name
  }
}
##########################################################