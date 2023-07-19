resource "random_pet" "server" {
}

provider "aws" {
  region = "us-west-2"
}

terraform {
  required_version = ">= 0.12"
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "demo" {
  ami = data.aws_ami.ubuntu.id
  
   #instance_type = "t2.xlarge"
   instance_type = "t2.small"

  key_name = var.ssh_key_name

  tags = {
    Name = random_pet.server.id
    #uncomment this for working, comment out for sentinel policy trigger
    Owner = "chrisd"
    TTL   = "24hrs"
  }
#  user_data = data.template_file.cloud-init.rendered
}


#data "template_file" "cloud-init" {
#  template = file("cloud-init.tpl")
#  vars = {
#    boinc_project_id = var.boinc_project_id
#  }
#}


resource "aws_s3_bucket" "bigbucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = "Secure S3 bucket"
    Environment = "Dev"
  }
}

/*
resource "aws_s3_bucket_acl" "secure" {
  bucket = aws_s3_bucket.bigbucket.id
  acl    = var.s3_bucket_acl
}
*/
