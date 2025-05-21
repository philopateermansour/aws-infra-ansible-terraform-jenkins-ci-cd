resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.main["public-subnet-1"].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.main["public-subnet-2"].id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.main["private-subnet"].id
  route_table_id = aws_route_table.private.id
}
