##########################################################
#  Module DB -> RDS MYSQL
##########################################################
module "db" {
  count                       = local.rds_mysql.create ? 1 : 0
  source                      = "terraform-aws-modules/rds/aws"
  version                     = "3.1.0"
  identifier                  = local.rds_mysql.identifier
  allocated_storage           = local.rds_mysql.allocated_storage
  max_allocated_storage       = local.rds_mysql.max_allocated_storage
  storage_type                = "gp2"
  engine                      = "mysql"
  engine_version              = "8.0.27"
  instance_class              = local.rds_mysql.instance_class
  username                    = local.rds_mysql.username
  password                    = local.rds_mysql.password
  port                        = 3306
  availability_zone           = local.rds_mysql.availability_zones_db
  vpc_security_group_ids      = [aws_security_group.sg_rds_mysql.id]
  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true
  backup_retention_period     = 0
  multi_az                    = false
  skip_final_snapshot         = true

  # DB subnet group
  create_db_subnet_group = true
  subnet_ids             = module.vpc.private_subnets[*]
  family                 = "mysql8.0"
  major_engine_version   = "8.0"
}
##########################################################
