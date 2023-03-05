##########################################################
output "Instancia_Zabbix" {
  value = {
    Ami               = local.EC2_Instance_Zabbix.Ami.id,
    Ami_Description   = local.EC2_Instance_Zabbix.Ami.description,
    Availability_Zone = aws_instance.zabbix-server.availability_zone,
    Chave             = aws_instance.zabbix-server.key_name,
    Instancia_Tipo    = aws_instance.zabbix-server.instance_type,
    Private_Ip        = aws_instance.zabbix-server.private_ip,
    Public_Ip         = aws_instance.zabbix-server.public_ip,
    Regiao            = local.region,
    Tag_Name          = local.EC2_Instance_Zabbix.Tag_Name,
  }
}
##########################################################
output "Instancia_Web_01" {
  value = {
    Ami               = local.EC2_Instance_Web_01.Ami.id,
    Ami_Description   = local.EC2_Instance_Web_01.Ami.description,
    Availability_Zone = aws_instance.web_01.availability_zone,
    Chave             = aws_instance.web_01.key_name,
    Instancia_Tipo    = aws_instance.web_01.instance_type,
    Private_Ip        = aws_instance.web_01.private_ip,
    Public_Ip         = aws_instance.web_01.public_ip,
    Regiao            = local.region,
    Tag_Name          = local.EC2_Instance_Web_01.Tag_Name,
  }
}
##########################################################
output "Instancia_Web_02" {
  value = {
    Ami               = local.EC2_Instance_Web_02.Ami.id,
    Ami_Description   = local.EC2_Instance_Web_02.Ami.description,
    Availability_Zone = aws_instance.web_02.availability_zone,
    Chave             = aws_instance.web_02.key_name,
    Instancia_Tipo    = aws_instance.web_02.instance_type,
    Private_Ip        = aws_instance.web_02.private_ip,
    Public_Ip         = aws_instance.web_02.public_ip,
    Regiao            = local.region,
    Tag_Name          = local.EC2_Instance_Web_02.Tag_Name,
  }
}
##########################################################