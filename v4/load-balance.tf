##########################################################
resource "aws_lb" "alb" {
  load_balancer_type = "application"
  name               = "alb-${local.alb_name}"
  security_groups    = [aws_security_group.sg_port_80.id, aws_security_group.sg_port_443.id]
  subnets            = module.vpc.public_subnets[*]
  tags = {
    Name = "alb-${local.alb_name}"
  }
  #   access_logs {
  #     enabled = true
  #     bucket  = "alb-logs-bucket"
  #     prefix  = "web-lb"
  #   }

}
##########################################################
resource "aws_lb_target_group" "alb_tg" {
  name        = "tg-${local.alb_name}"
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
    Name = "tg-${local.alb_name}"
  }
}
##########################################################
resource "aws_lb_listener" "alb_listener_http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}
##########################################################
resource "aws_alb_target_group_attachment" "target_group_attachment" {
  count            = local.criar_alb ? length(aws_instance.web[*]) : 0
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.web[count.index].id
  port             = 80
}
##########################################################
