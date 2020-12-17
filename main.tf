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
}