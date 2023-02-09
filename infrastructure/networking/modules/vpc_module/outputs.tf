output "subnet_id" {
    value = aws_subnet.subnet1a.id
}

output "vpc_security_group_ids" {
    value = aws_security_group.ssh_allowed.id
}