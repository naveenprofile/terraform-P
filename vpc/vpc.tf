resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "subnets" {
  count             = 2
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = aws_vpc.main.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-${count.index}"
  }

  depends_on = [aws_vpc.main]
}


variable "instances" {
  default = {
    web01 = "production"
    db01  = "staging"
    app01 = "dev"
  }
}

resource "aws_instance" "servers" {
  for_each = var.instances

  ami           = "ami-08982f1c5bf93d976"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnets[lookup({
    "web01" = 0,
    "db01"  = 1,
    "app01" = 0
  }, each.key, 0)].id


  tags = {
    Name        = each.key
    Environment = each.value
  }
}
