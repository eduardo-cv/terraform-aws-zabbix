##########################################################
# Obtenha o Amazon Linux 2 AMI kernel-5.10
data "aws_ami" "amazon-linux-2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
}
##########################################################
# Obtenha o Ubuntu Linux 22.04 AMI 20230208
data "aws_ami" "ubuntu-22" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230208"]
  }
}
##########################################################
# Obtenha o Debian Linux 11 AMI amd64-20230124-1270
data "aws_ami" "debian-11" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["debian-11-amd64-*"]
  }
}
##########################################################