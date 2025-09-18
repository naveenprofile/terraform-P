provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.pem_key
    tags = var.tag

}