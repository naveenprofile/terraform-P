variable "region" {
    type = string
    description = "location"
}

variable "access_key" {
    description = "root access key"
    type = string
    
}

variable "secret_key" {
    description = "root secret key"
    type = string

}

variable "ami" {
    description = "ami"
    type = string
}

variable "instance_type" {
    description = "instance"
    type = string
}

variable "pem_key" {
    description = "pem key"
    type = string
}

variable "tag" {
    description = "instance tags"
    type = map(string)
}

