##########################################################
module "db" {
  count                       = local.criar_rds ? 1 : 0
  source                      = "terraform-aws-modules/rds/aws"
  version                     = "3.1.0"
  identifier                  = "rds-mysql-zabbix"
  allocated_storage           = 20
  max_allocated_storage       = 22
  storage_type                = var.db_storage_type["gp2"]
  engine                      = "mysql"
  engine_version              = "8.0.27"
  instance_class              = "db.t3.micro"
  username                    = "admin"
  password                    = "admin1234"
  port                        = 3306
  availability_zone           = local.availability_zones_db
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
