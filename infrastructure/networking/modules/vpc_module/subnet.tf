resource "aws_subnet" "subnet1a" {
    vpc_id = "${aws_vpc.main_pawelkur.id}"
    cidr_block = "10.0.0.0/28"
    availability_zone = "eu-central-1a"

}
resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.subnet1a.id}"
  route_table_id = "${aws_route_table.route_pawelkur.id}"
}