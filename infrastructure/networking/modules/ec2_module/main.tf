resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    #vpc_security_group_ids = var.vpc_security_group_ids
    associate_public_ip_address = var.associate_public_ip_address
    source_dest_check = var.source_dest_check
    
    tags = {
      "Name" = "pawel_kur_ec2_test"
      "created_by" = "pawel_kur"
    }  
    volume_tags = {
      "Name" = "pawel_kur_ec2_test_volume"
      "created_by" = "pawel_kur"
    }  

}