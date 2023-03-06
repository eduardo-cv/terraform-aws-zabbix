##########################################################
output "instancia_web" {
  value = local.instancia_web_output
}
##########################################################
output "instancia_zabbix" {
  value = local.instancia_zabbix_output
  #  sensitive   = true
}
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
output "endpoint_alb" {
  value = {
    alb_endpoint = local.criar_alb ? aws_lb.alb.dns_name : ""
  }
}
##########################################################
output "endpoint_rds" {
  value = {
    db_instance_endpoint = module.db[*].db_instance_endpoint
  }
}
##########################################################
output "zone_avaliable" {
  value = {
    azs = slice(local.vpc_azs_avaliable, 0, local.vpc_azs_avaliable_count)
  }
}
##########################################################
