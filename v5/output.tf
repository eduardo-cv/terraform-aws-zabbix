##########################################################
#  Saida de dados -> Instancias WEB
##########################################################
output "instancia_web" {
  value = local.instancia_web_output
}
##########################################################
#  Saida de dados -> Instancias Zabbix
##########################################################
output "instancia_zabbix" {
  value = local.instancia_zabbix_output
  #  sensitive   = true
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
    alb_endpoint = var.create_lb ? aws_lb.alb[0].dns_name : ""
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
#  Saida de dados -> Zonas de Disponibilidade
##########################################################
output "zone_avaliable" {
  value = slice(local.vpc_azs_avaliable, 0, local.vpc_azs_avaliable_count)
}
##########################################################
