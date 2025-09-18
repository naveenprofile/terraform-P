variable "region" {
    description = "aws region"
    default = "us-east-1"
}

variable "ami" {
    description = "aws ami"
    default = "ami-0b09ffb6d8b58ca91"
}

variable "instance_type" {
    description = "instanace type"
    default = "t2.micro"
}

variable "instance_count" {
    description = "No of instances"
    default = 2
    type = number
}

variable "enable_public_ip" {
    description = "enable public ip"
    type = bool
    default = true
}


/*variable "iam_users" {
    type = list(string)
    default = ["user1", "user2", "user3"]
}
*/

variable "project_env" {
    type = map(string)
    default = {
        project = "terraform-project",
        env = "dev"
    }
}

