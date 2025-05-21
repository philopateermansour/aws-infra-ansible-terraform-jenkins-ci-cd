resource "aws_security_group" "app_sg" {
  name        = "Application security group"
  description = "Allow SSH, HTTP inbound traffic, and all outbound traffic"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id]
  }
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app_sg"
  }
}