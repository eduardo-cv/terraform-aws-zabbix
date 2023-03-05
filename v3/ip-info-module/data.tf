##########################################################
#         Data - [ip-info-module]
##########################################################
data "http" "ip-address" {
  url    = "https://ipinfo.io/"
  method = "GET"
  request_headers = {
    Accept = "application/json"
  }
}
##########################################################