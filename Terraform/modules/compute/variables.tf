variable "instance_ami" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
variable "private_subnet_id" {
  type = string
}
variable "bastion_sg" {
  type = string
}
variable "app_sg" {
  type = string
}
variable "public_ec2_name" {
  type = string
}
variable "private_ec2_name" {
  type = string
}
variable "instance_type" {
  type = string
}