##########################################################
variable "ec2_key_par" {
  type = map(string)
  default = {
    "us-east-1" = "par_virginia_linux"
    "us-east-2" = "par_ohio_linux"
  }
}
##########################################################
variable "db_storage_type" {
  type = map(string)
  default = {
    "gp2" = "gp2"
    "gp3" = "gp3"
    "io1" = "io1"
  }
}
##########################################################