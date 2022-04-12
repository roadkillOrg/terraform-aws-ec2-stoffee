#variable "boinc_project_id" {
#  description = "Boinc Project id: boinccmd --lookup_account URL email password https://boinc.berkeley.edu/wiki/Boinccmd_tool"
#  default = "0abc390da3c3b820dd884024d84d8cbf"
#}
variable "ssh_key_name" {
  description = "You AWS SSH KeyName"
}

variable "s3_bucket_name" {
  description = "Your S3 bucket name"
}
