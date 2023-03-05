##########################################################
module "vpc" {
  source             = "terraform-aws-modules/vpc/aws"
  version            = "~> 3.0"
  name               = local.vpc-name
  cidr               = local.vpc-cidr-blocks
  azs                = slice(local.vpc-azs-avaliable, 0, local.vpc-azs-avaliable-count)
  private_subnets    = slice(local.vpc-private-subnet-cidr-blocks, 0, local.vpc-private-subnet-count)
  public_subnets     = slice(local.vpc-public-subnet-cidr-blocks, 0, local.vpc-public-subnet-count)
  enable_nat_gateway = local.vpc-enable-nat-gateway
}
##########################################################