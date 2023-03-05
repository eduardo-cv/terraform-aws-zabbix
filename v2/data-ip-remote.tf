##########################################################
data "http" "ip_address" {
  url    = "https://ipinfo.io/"
  method = "GET"
  request_headers = {
    Accept = "application/json"
  }
}
##########################################################
locals {
  ip_address = jsondecode(data.http.ip_address.response_body)
}
##########################################################