provider "aws" {
  region = "us-east-1"
}

/*resource "aws_s3_bucket" "s3" {
    bucket = "my-terraform-naveen"

    tags = {
        env = "dev"
    }
}
*/

resource "aws_security_group" "ec2-sg" {
  name = "allow-ssh"
  description = "allow ssh inbound"

  ingress {
    from_port = 22
    to_port = 22
    protocol = tcp
    cidr_blocks = ["0.0.0.0/0"]
  
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2" {
  ami = 
  instance_type = "t2.micro"
  vpc_security_group_ids = "["aws_security_group.ec2-sg.id"]

  tags = {
    name = "ec2"
  }
}