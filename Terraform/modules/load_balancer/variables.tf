variable "lb_name" {
  type = string
}
variable "lb_sg_id" {
  type = string
}
variable "public_subnet_ids" {
    type = list(string)
}
variable "vpc_id" {
  type = string
}