provider "aws" {
  region = var.region
}

resource "aws_instance" "my-instance" {
    ami = var.ami
    instance_type = var.instance_type
    count = var.instance_count
    key_name = "lti"
    associate_public_ip_address = var.enable_public_ip

    tags = var.project_env

    
}


/*resource "aws_iam_user" "users" {
  count = length(var.iam_users)
  name = var.iam_users[count.index]
}
*/