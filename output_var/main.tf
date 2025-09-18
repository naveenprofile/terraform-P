resource "aws_instance" "my-instance" {
    count = var.instance_count
    ami = var.ami
    instance_type = var.instance_type

    tags = {
        Name = "${var.server_name}-${count.index + 1}"
    }
}

locals {
    server_name = "${var.server_name}"
}