resource "aws_security_group" "ssh_allowed" {
    vpc_id = "${aws_vpc.main_pawelkur.id}"

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 22
      protocol = "tcp"
      to_port = 22
    }

}