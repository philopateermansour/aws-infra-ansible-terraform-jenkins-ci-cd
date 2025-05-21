resource "aws_security_group" "lb_sg" {
  name        = "Load balancer security group"
  description = "Allow HTTP inbound traffic, and all outbound traffic"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "lb_sg"
  }
}