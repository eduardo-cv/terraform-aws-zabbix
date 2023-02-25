##########################################################
module "ec2_instance" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "~> 4.3"
  count                       = 1
  name                        = local.ec2_tag_name
  ami                         = local.ec2_ami
  instance_type               = local.ec2_instance_type
  subnet_id                   = local.ec2_instance_vpc_subnet
  vpc_security_group_ids      = local.ec2_instance_security_group_ids
  associate_public_ip_address = local.ec2_associate_public_ip_address
  key_name                    = var.ec2_key_par["${local.region}"]

  user_data = <<-EOF
    ${file("user-data.sh")}
  EOF  

  depends_on = [module.db[0].db_instance_endpoint]
}
##########################################################