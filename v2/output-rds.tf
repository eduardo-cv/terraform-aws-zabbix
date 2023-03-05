##########################################################
output "rds-endpoint" {
  value = {
    db_instance_endpoint = module.db[*].db_instance_endpoint
  }
}
##########################################################