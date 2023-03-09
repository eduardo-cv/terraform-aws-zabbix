##########################################################
#             EC2 instance - [zabbix-server]              
##########################################################
resource "aws_instance" "zabbix-server" {
  count                       = local.ec2_zabbix_server.count
  ami                         = local.ec2_zabbix_server.ami.id
  instance_type               = local.ec2_zabbix_server.instance_type
  vpc_security_group_ids      = local.ec2_zabbix_server.sg_ids
  subnet_id                   = local.pub_subnet_ids.zabbix[count.index]
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
#                  EC2 instance - [web]                       
##########################################################
resource "aws_instance" "web" {
  count                       = local.ec2_web.count
  ami                         = local.ec2_web.ami.id
  instance_type               = local.ec2_web.instance_type
  vpc_security_group_ids      = local.ec2_web.sg_ids
  subnet_id                   = local.pub_subnet_ids.web[count.index]
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
#                  EC2 instance - [grafana]                       
##########################################################
resource "aws_instance" "grafana" {
  count                       = local.ec2_grafana.count
  ami                         = local.ec2_grafana.ami.id
  instance_type               = local.ec2_grafana.instance_type
  vpc_security_group_ids      = local.ec2_grafana.sg_ids
  subnet_id                   = local.pub_subnet_ids.grafana[count.index]
  associate_public_ip_address = local.ec2_grafana.associate_public_ip
  key_name                    = local.ec2_grafana.key_name

  user_data = <<-EOF
    ${file("./files-user-data/user-data-grafana.sh")}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.ec2_grafana.volume_size
  }

  depends_on = [module.vpc]

  tags = {
    Name = local.ec2_grafana.tag_name
  }
}
##########################################################