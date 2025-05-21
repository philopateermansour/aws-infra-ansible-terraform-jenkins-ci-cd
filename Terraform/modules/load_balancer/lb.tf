resource "aws_lb" "alb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = var.public_subnet_ids
}
resource "aws_lb_target_group" "tg" {
  name     = "tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "instance"
  health_check {
    path                = "/index.html"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}
resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}