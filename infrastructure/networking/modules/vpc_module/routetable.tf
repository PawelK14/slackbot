resource "aws_route_table" "route_pawelkur" {
  vpc_id = "${aws_vpc.main_pawelkur.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw_pk.id
  }
}