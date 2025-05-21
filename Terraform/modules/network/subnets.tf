resource "aws_subnet" "main" {
  for_each = { for subnet in local.subnets :subnet.name => subnet }
  vpc_id     = aws_vpc.main.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.az
  map_public_ip_on_launch = each.value.public ? true : false 
  
  tags = {
    Name = each.value.name
    Type = each.value.public ? "public" : "private"
  }
}