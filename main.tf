provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "us-west-2"
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
  instance_type = "t2.micro"

  tags = {
    Name = "Demo"
    Owner = "stoffee"
    TTL = "24"
      }   
}

resource "aws_launch_template" "demo-lt" {
  name_prefix   = "demo-"
  image_id      = "ami-076b01046426fd1c5"
  instance_type = "t2.micro"
}

resource "aws_autoscaling_group" "demo-ag" {
  availability_zones = ["us-west-2a"]
  desired_capacity   = 1
  max_size           = 1
  min_size           = 1

  launch_template {
    id      = "${aws_launch_template.demo-lt.id}"
    version = "$$Latest"
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
