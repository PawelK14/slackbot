variable "ami" { 
    type    = string
    default = "ami-0dae3a932d090b3de"
}
variable "instance_type" {
    type    = string
    default = "t3.micro"
    
}
variable "associate_public_ip_address" {
    type    = string
    default = "true"    
}
variable "source_dest_check" {
    type    = string
    default = "false"
}
variable "subnet_id" {
    
}
variable "vpc_security_group_ids" {
    
}