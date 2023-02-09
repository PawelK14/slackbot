variable "cidr" {
    type = string
}
variable "instance_tenancy" {
    type    = string
    default = "default"
}
variable "dns_host" {
    type    = string
    default = "true"
}
variable "dns_support" {
    type    = string
    default = "true"
}
