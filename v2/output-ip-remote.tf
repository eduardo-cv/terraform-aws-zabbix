##########################################################
output "remote" {
  value = {
    ip       = "${"***"}${substr(local.ip_address.ip, 3, length(local.ip_address.ip))}",
    hostname = "${"***"}${substr(local.ip_address.hostname, 3, length(local.ip_address.hostname))}",
    city     = "${local.ip_address.city}",
    region   = "${local.ip_address.region}",
    country  = "${local.ip_address.country}",
    org      = "${local.ip_address.org}"
  }
}
##########################################################