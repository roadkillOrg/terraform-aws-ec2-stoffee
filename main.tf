//--------------------------------------------------------------------
// Variables
variable "ec2_instance_cpu_credits" {}
variable "ec2_instance_disable_api_termination" {}
variable "ec2_instance_ebs_block_device" {}
variable "ec2_instance_ebs_optimized" {}
variable "ec2_instance_ephemeral_block_device" {}
variable "ec2_instance_iam_instance_profile" {}
variable "ec2_instance_instance_count" {}
variable "ec2_instance_instance_initiated_shutdown_behavior" {}
variable "ec2_instance_ipv6_address_count" {}
variable "ec2_instance_ipv6_addresses" {}
variable "ec2_instance_key_name" {}
variable "ec2_instance_monitoring" {}
variable "ec2_instance_network_interface" {}
variable "ec2_instance_placement_group" {}
variable "ec2_instance_private_ip" {}
variable "ec2_instance_root_block_device" {}
variable "ec2_instance_source_dest_check" {}
variable "ec2_instance_tags" {}
variable "ec2_instance_tenancy" {}
variable "ec2_instance_user_data" {}
variable "ec2_instance_volume_tags" {}

//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
  source  = "app.terraform.io/cdunlap/ec2-instance/aws"
  version = "1.13.0"

  ami = "ami-076b01046426fd1c5"
  associate_public_ip_address = "true"
  cpu_credits = "${var.ec2_instance_cpu_credits}"
  disable_api_termination = "${var.ec2_instance_disable_api_termination}"
  ebs_block_device = "${var.ec2_instance_ebs_block_device}"
  ebs_optimized = "${var.ec2_instance_ebs_optimized}"
  ephemeral_block_device = "${var.ec2_instance_ephemeral_block_device}"
  iam_instance_profile = "${var.ec2_instance_iam_instance_profile}"
  instance_count = "${var.ec2_instance_instance_count}"
  instance_initiated_shutdown_behavior = "${var.ec2_instance_instance_initiated_shutdown_behavior}"
  instance_type = "m1-small"
  ipv6_address_count = "${var.ec2_instance_ipv6_address_count}"
  ipv6_addresses = "${var.ec2_instance_ipv6_addresses}"
  key_name = "${var.ec2_instance_key_name}"
  monitoring = "${var.ec2_instance_monitoring}"
  name = "cd-demo-"
  network_interface = "${var.ec2_instance_network_interface}"
  placement_group = "${var.ec2_instance_placement_group}"
  private_ip = "${var.ec2_instance_private_ip}"
  root_block_device = "${var.ec2_instance_root_block_device}"
  source_dest_check = "${var.ec2_instance_source_dest_check}"
  subnet_id = "172.31.0.0/16"
  tags = "${var.ec2_instance_tags}"
  tenancy = "${var.ec2_instance_tenancy}"
  user_data = "${var.ec2_instance_user_data}"
  volume_tags = "${var.ec2_instance_volume_tags}"
  vpc_security_group_ids = "sg-ad93ecd7"
}
