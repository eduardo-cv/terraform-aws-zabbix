##########################################################
output "instancia-web" {
  value = local.instancia_web_output
}
##########################################################
output "instancia-zabbix" {
  value = local.instancia_zabbix_output
}
##########################################################
output "ip-info" {
  value = module.ip-info-module.remote
}
##########################################################
output "rds-endpoint" {
  value = {
    db_instance_endpoint = module.db[*].db_instance_endpoint
  }
}
##########################################################
output "zone_avaliable" {
  value = {
    azs = slice(local.vpc-azs-avaliable, 0, local.vpc-azs-avaliable-count)
  }
}
##########################################################
