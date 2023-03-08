##########################################################
# 
##########################################################
resource "aws_lb" "alb" {
  count              = var.create_lb ? 1 : 0
  name               = "lb-${local.projeto_name}"
  load_balancer_type = "application"
  subnets            = module.vpc.public_subnets[*]
  security_groups    = [aws_security_group.sg_port_80.id, aws_security_group.sg_port_443.id]
  tags = {
    Name = "lb-${local.projeto_name}"
  }
}
##########################################################
# 
##########################################################
resource "aws_lb_target_group" "tg_group" {
  count       = var.create_lb ? 1 : 0
  name        = "tg-${local.projeto_name}"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = module.vpc.vpc_id
  health_check {
    healthy_threshold = 2
    path              = "/"
    matcher           = "200,301,302,403"
  }
  stickiness {
    cookie_duration = 3600
    enabled         = true
    type            = "lb_cookie"
    cookie_name     = "web-cookie"
  }
  tags = {
    Name = "tg-${local.projeto_name}"
  }
}
##########################################################
# 
##########################################################
resource "aws_lb_listener" "listener_http" {
  count             = length(aws_lb.alb)
  load_balancer_arn = aws_lb.alb[count.index].arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = var.create_lb ? aws_lb_target_group.tg_group[0].arn : ""
  }
}
##########################################################
# 
##########################################################
resource "aws_lb_target_group_attachment" "attachment_target" {
  count            = var.create_lb ? length(aws_instance.web[*]) : 0
  target_group_arn = aws_lb_target_group.tg_group[0].arn
  target_id        = aws_instance.web[count.index].id
  port             = 80

  depends_on = [aws_lb_target_group.tg_group]
}
##########################################################