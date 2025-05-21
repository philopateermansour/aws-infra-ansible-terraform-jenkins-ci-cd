variable "aws_region" {
  type = string
}
variable "instance_ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "public_ec2_name" {
  type = string
}
variable "private_ec2_name" {
  type = string
}
variable "vpc_name" {
  type = string
}
variable "vpc_cidr" {
  type = string
}
variable "internet_gw_name" {
  type = string
}
variable "nat_gw_name" {
  type = string
}
variable "public_route_table_name" {
  type = string
}
variable "private_route_table_name" {
  type = string
}
variable "load_balancer_name" {
  type = string 
}

