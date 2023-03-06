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
# variable "files" {
#   description = "Configuração para website files."
#   type = object({
#     terraform_managed     = bool
#     error_document_key    = optional(string, "error.html")
#     index_document_suffix = optional(string, "index.html")
#     www_path              = optional(string)
#   })
# }
##########################################################