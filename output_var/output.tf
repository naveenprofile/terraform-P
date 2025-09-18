output "fetch_public_ips" {
    value = ["${aws_instance.my-instance.*.public_ip}"]
}