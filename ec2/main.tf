provider "aws" {
  region = "us-east-1"
}

/*resource "aws_instance" "my_instance" {
  ami = "ami-0b09ffb6d8b58ca91"
  instance_type = "t2.small"
  key_name = "lti"

  tags = {
    name = "terraform-ec2"
  }
}
*/

resource "aws_security_group" "ec2-sg" {
  name = "allow-ssh"
  description = "allow ssh inbound rule"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
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
  ami = "ami-0b09ffb6d8b58ca91"
  instance_type = "t2.small"
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]

  tags = {
    ame = "ec2"
  }

}
