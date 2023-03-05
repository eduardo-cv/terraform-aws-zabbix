##########################################################
locals {
  vpc_cidr_blocks = "${local.vpc_cidr_pref}${".0.0/16"}"
}
##########################################################
locals {
  vpc_azs_avaliable = [
    "${local.region}a",
    "${local.region}b",
    "${local.region}c",
    "${local.region}d",
    "${local.region}e",
    "${local.region}f",
  ]
}
##########################################################
locals {
  vpc_public_subnet_cidr_blocks = [
    "${local.vpc_cidr_pref}${".1.0/24"}",
    "${local.vpc_cidr_pref}${".2.0/24"}",
    "${local.vpc_cidr_pref}${".3.0/24"}",
    "${local.vpc_cidr_pref}${".4.0/24"}",
    "${local.vpc_cidr_pref}${".5.0/24"}",
    "${local.vpc_cidr_pref}${".6.0/24"}",
    "${local.vpc_cidr_pref}${".7.0/24"}",
    "${local.vpc_cidr_pref}${".8.0/24"}"
  ]
}
##########################################################
locals {
  vpc_private_subnet_cidr_blocks = [
    "${local.vpc_cidr_pref}${".101.0/24"}",
    "${local.vpc_cidr_pref}${".102.0/24"}",
    "${local.vpc_cidr_pref}${".103.0/24"}",
    "${local.vpc_cidr_pref}${".104.0/24"}",
    "${local.vpc_cidr_pref}${".105.0/24"}",
    "${local.vpc_cidr_pref}${".106.0/24"}",
    "${local.vpc_cidr_pref}${".107.0/24"}",
    "${local.vpc_cidr_pref}${".108.0/24"}"
  ]
}
##########################################################