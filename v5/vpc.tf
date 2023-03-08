##########################################################
#  Module VPC
##########################################################
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "~> 3.0"
  name               = "vpc-${local.projeto_name}"
  cidr               = local.vpc_cidr_blocks
  azs                = slice(local.vpc_azs_avaliable, 0, local.vpc_azs_avaliable_count)
  private_subnets    = slice(local.vpc_private_subnet_cidr_blocks, 0, local.vpc_private_subnet_count)
  public_subnets     = slice(local.vpc_public_subnet_cidr_blocks, 0, local.vpc_public_subnet_count)
  enable_nat_gateway = false # Colocar false pelo motivo de cobrança da aws
}
##########################################################
