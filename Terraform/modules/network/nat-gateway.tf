resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_gw_ip.id
  subnet_id     = aws_subnet.main["public-subnet-1"].id

  tags = {
    Name = var.nat_gw_name
  }

  depends_on = [aws_internet_gateway.gw]
}