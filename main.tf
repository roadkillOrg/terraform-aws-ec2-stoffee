provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  #for demo, don't change this
  region = "us-east-2"
}

variable "aws_access_key" {
  description = "access key"
}

variable "aws_secret_key" {
  description = "secret key"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "demo" {
  ami           = "${data.aws_ami.ubuntu.id}"
  #for demo, do not change this
  instance_type = "t2.large"
  key_name = "cd-demo"
  
  tags = {
    Name = "cdunlap simple ec2 demo"
    # for demo, uncomment this
   # Owner = "cdunlap@hashicorp.com"
    TTL = "24h"
      }   
}

output "private_ip" {
  description = "Private IP of instance"
  value       = "${join("", aws_instance.demo.*.private_ip)}"
}

output "public_ip" {
  description = "Public IP of instance (or EIP)"
  value       = "${join("", aws_instance.demo.*.public_ip)}"
}
