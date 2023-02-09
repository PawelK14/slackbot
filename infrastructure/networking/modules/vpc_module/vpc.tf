resource "aws_vpc" "main_pawelkur" {

    cidr_block = var.cidr
    instance_tenancy = var.instance_tenancy
    enable_dns_hostnames = var.dns_host
    enable_dns_support = var.dns_support
    
}