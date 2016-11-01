#

# DO NOT DELETE THESE LINES!

#

# Your subnet ID is:

#

#     subnet-d56fbc8e

#

# Your security group ID is:

#

#     sg-57e40c2a

#

# Your AMI ID is:

#

#     ami-c9580bde

#

# Your Identity is:

#

#     datapipe-stork

#

#module "example-module" {
#}

variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "aws_region" {
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count			 = "1"
  ami                    = "ami-c9580bde"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-d56fbc8e"
  vpc_security_group_ids = ["sg-57e40c2a"]

  tags {
    Name  = "Terra_instance"
    ENV   = "UAT"
    Group = "Terra_Test"
  }
}

output "public_ip" {
  value	= ["${aws_instance.web.*.public_ip}"]
}

