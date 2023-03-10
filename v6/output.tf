##########################################################
#  Saida de dados -> Instancias WEB
##########################################################
output "instancia_zabbix" {
  value = {
    for i, aws_instance in aws_instance.zabbix-server : "zabbix-server-${format("%03d", "${i + 1}")}" => {
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
#  Saida de dados -> Instancias Zabbix
##########################################################
output "instancia_web" {   
  value = {
    for i, aws_instance in aws_instance.web : "web-${format("%03d", "${i + 1}")}" => {
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
#  Saida de dados -> Instancias grafana
##########################################################
output "instancia_grafana" {
  value = {
    for i, aws_instance in aws_instance.grafana : "grafana-${format("%03d", "${i + 1}")}" => {
      ami_id            = aws_instance.ami
      ami_descricao     = local.ec2_grafana.ami.description
      availability_zone = aws_instance.availability_zone
      chave             = aws_instance.key_name
      instancia_tipo    = aws_instance.instance_type
      private_ip        = aws_instance.private_ip
      public_ip         = aws_instance.public_ip
      tag               = local.ec2_grafana.tag_name
    }
  }
}
##########################################################
#  Saida de dados -> Seu IP Address
##########################################################
output "ip_info" {
  value = {
    cidade    = "${local.remote_address.city}",
    estado    = "${local.remote_address.region}",
    ip        = "${"***"}${substr(local.remote_address.ip, 3, length(local.remote_address.ip))}",
    hostname  = "${"***"}${substr(local.remote_address.hostname, 3, length(local.remote_address.hostname))}",
    operadora = "${local.remote_address.org}",
    pais      = "${local.remote_address.country}"
  }
}
##########################################################
#  Saida de dados -> DNS - Load Balance
##########################################################
output "application_load_balance" {
  value = {
    alb_endpoint = local.create_lb ? aws_lb.alb[0].dns_name : ""
  }
}
##########################################################
#  Saida de dados -> Endpoint - RDS
##########################################################
output "endpoint_rds" {
  description = "O endpoint de conexão do rds."
  value = {
    rds = module.db[*].db_instance_endpoint
  }
}
##########################################################
