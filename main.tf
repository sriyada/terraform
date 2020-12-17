terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/Users/sriharshayadagani/.aws/credentials"
}

resource "aws_vpc" "terraform" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
      Name = "Terraform"
  }
}
resource "aws_subnet" "terraform" {
    vpc_id = aws_vpc.terraform.id
    cidr_block = "10.5.0.0/16"

    tags = {
        Name = "TerraformSubnet"
    }
}
resource "aws_security_group" "terraform" {
name = "allow-all-sg"
vpc_id = aws_vpc.terraform.id}
ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

resource "aws_instance" "harsha" {
    ami   = "ami-04d29b6f966df1537"
    instance_type  = "t2.micro"
    key_name = "Harsha"
    subnet_id = aws_subnet.terraform.id
    security_groups = ["${aws_security_group.terraform.id}"]
}