output "public-subnets" {
  value = [
    for subnet in aws_subnet.main :
    subnet.id if subnet.tags["Type"] == "public"
  ]
}
output "private-subnets" {
  value = [
    for subnet in aws_subnet.main :
    subnet.id if subnet.tags["Type"] == "private"
  ]
}
output "vpc-id" {
  value = aws_vpc.main.id
}