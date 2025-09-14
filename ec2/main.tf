provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
  ami                         = "ami-0b09ffb6d8b58ca91"
  instance_type               = "t2.micro"
  subnet_id                   = "subnet-028653b0c39efced9"
  vpc_security_group_ids      = ["sg-0870ed67b90297806"]
  associate_public_ip_address = true
  key_name                    = "awsfree"
  tags = {
    name = "myec2"

  }

}