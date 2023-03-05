##########################################################
#         Main - [root] -> Lab Zabbix - v2                
##########################################################
module "ip-info-module" {
  source = "./ip-info-module"
}
##########################################################

# terraform init
# terraform apply --auto-approve
# terraform destroy --auto-approve
# terraform show