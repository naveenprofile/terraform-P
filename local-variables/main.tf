provider "aws" {
  region = "us-east-1"
}

locals {
    dev-env = "${var.local_var}"
}

resource "aws_vpc" "my-vpc" {
    cidr_block = var.cidr_block
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
    Name = "${local.dev-env}-lti-vpc"
    }
}


