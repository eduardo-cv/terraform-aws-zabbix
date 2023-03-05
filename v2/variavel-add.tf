##########################################################
variable "regiao" {
  type = map(string)
  default = {
    "us-east-1" = "us-east-1"
    "us-east-2" = "us-east-2"
  }
}
##########################################################
variable "ec2_key_par" {
  type = map(string)
  default = {
    "us-east-1" = "par_virginia_linux"
    "us-east-2" = "par_ohio_linux"
  }
}
##########################################################
variable "ec2_instance_type" {
  type = map(string)
  default = {
    "t2.micro" = "t2.micro"
    "t3.micro" = "t3.micro"
  }
}
##########################################################
variable "ec2_linux_dist" {
  type = map(string)
  default = {
    "amazon-linux-2" = "amazon-linux-2"
    "ubuntu-22"      = "ubuntu-22"
    "debian-11"      = "debian-11"
  }
}
##########################################################