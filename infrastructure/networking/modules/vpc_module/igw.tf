resource "aws_internet_gateway" "igw_pk" {
  vpc_id = "${aws_vpc.main_pawelkur.id}"
}