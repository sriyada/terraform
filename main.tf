terraform {
  backend "s3" {
    bucket = "terra-remote"
    key    = "dev/terra/terraform.state"
    region = "us-east-1"
  }
}

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
  #shared_credentials_file = "/Users/sriharshayadagani/.aws/credentials"
}

resource "aws_vpc" "terraform" {
  cidr_block = "10.5.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
      Name = "terraform12"
  }
}
resource "aws_subnet" "terraform1" {
  vpc_id = aws_vpc.terraform.id
  cidr_block = "10.5.2.0/16"
  map_public_ip_on_launch = true
  availability_zone = us-east-1b

  tags = {
        Name = "TerraformSubnet22"
    }
}
resource "aws_subnet" "terraform" {
    vpc_id = aws_vpc.terraform.id
    cidr_block = "10.5.1.0/16"
    map_public_ip_on_launch = true
    availability_zone = us-east-1a

    tags = {
        Name = "TerraformSubnet12"
    }
}
resource "aws_instance" "harsha" {
    ami   = "ami-04d29b6f966df1537"
    instance_type  = "t2.micro"
    key_name = "Harsha"
    subnet_id = aws_subnet.terraform.id
    #security_groups = aws_security_group.terraform.id

    tags = {
        Name = "terraform12"
    }
}