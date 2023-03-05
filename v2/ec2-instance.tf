resource "aws_instance" "zabbix-server" {
  ami                    = local.EC2_Instance_Zabbix.Ami.id
  instance_type          = local.EC2_Instance_Zabbix.EC2_Instance_Type
  vpc_security_group_ids = local.EC2_Instance_Zabbix.Security_Groups_Ids
  subnet_id              = local.EC2_Instance_Zabbix.Instance_Vpc_Subnet_Id
  key_name               = var.ec2_key_par["${local.region}"]

  user_data = <<-EOF
    ${file(local.EC2_Instance_Zabbix.File_User_Data)}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.EC2_Instance_Zabbix.Volume_Size
  }

  depends_on = [module.db[0].db_instance_endpoint]

  tags = {
    Name = local.EC2_Instance_Zabbix.Tag_Name
  }
}
##########################################################
resource "aws_instance" "web_01" {
  ami                    = local.EC2_Instance_Web_01.Ami.id
  instance_type          = local.EC2_Instance_Web_01.EC2_Instance_Type
  vpc_security_group_ids = local.EC2_Instance_Web_01.Security_Groups_Ids
  subnet_id              = local.EC2_Instance_Web_01.Instance_Vpc_Subnet_Id
  key_name               = var.ec2_key_par["${local.region}"]

  user_data = <<-EOF
    ${file(local.EC2_Instance_Web_02.File_User_Data)}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.EC2_Instance_Web_01.Volume_Size
  }   

  tags = {
    Name = local.EC2_Instance_Web_01.Tag_Name
  }
}
##########################################################
resource "aws_instance" "web_02" {
  ami                    = local.EC2_Instance_Web_02.Ami.id
  instance_type          = local.EC2_Instance_Web_02.EC2_Instance_Type
  vpc_security_group_ids = local.EC2_Instance_Web_02.Security_Groups_Ids
  subnet_id              = local.EC2_Instance_Web_02.Instance_Vpc_Subnet_Id
  key_name               = var.ec2_key_par["${local.region}"]

  user_data = <<-EOF
    ${file(local.EC2_Instance_Web_02.File_User_Data)}
  EOF 

  ebs_block_device {
    device_name = "/dev/xvda"
    volume_size = local.EC2_Instance_Web_02.Volume_Size
  }     

  tags = {
    Name = local.EC2_Instance_Web_02.Tag_Name
  }
}
##########################################################
