##########################################################
data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-type"
    values = ["availability-zone"]
  }
}
##########################################################
# azs      = data.aws_availability_zones.available.names