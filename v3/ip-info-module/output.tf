##########################################################
#         Output - [ip-info-module]
##########################################################
output "my_address_remote" {
  # Usado para preencher o security group da vpc SSH  
  value = {
    ip = "${local.remote_address.ip}"
  }
}
##########################################################
output "remote" {
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