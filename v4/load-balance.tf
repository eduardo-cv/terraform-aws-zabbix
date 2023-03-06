# ######
# # ELB
# ######
# module "elb" {
#   source = "../../"

#   name = "elb-example"

#   subnets         = data.aws_subnet_ids.all.ids
#   security_groups = [data.aws_security_group.default.id]
#   internal        = false

#   listener = [
#     {
#       instance_port     = "80"
#       instance_protocol = "http"
#       lb_port           = "80"
#       lb_protocol       = "http"
#     },
#     {
#       instance_port     = "8080"
#       instance_protocol = "http"
#       lb_port           = "8080"
#       lb_protocol       = "http"

#       //      Note about SSL:
#       //      This line is commented out because ACM certificate has to be "Active" (validated and verified by AWS, but Route53 zone used in this example is not real).
#       //      To enable SSL in ELB: uncomment this line, set "wait_for_validation = true" in ACM module and make sure that instance_protocol and lb_protocol are https or ssl.
#       //      ssl_certificate_id = module.acm.this_acm_certificate_arn
#     },
#   ]

#   health_check = {
#     target              = "HTTP:80/"
#     interval            = 30
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 5
#   }

#   access_logs = {
#     bucket = aws_s3_bucket.logs.id
#   }

#   tags = {
#     Owner       = "user"
#     Environment = "dev"
#   }

#   # ELB attachments
#   number_of_instances = var.number_of_instances
#   instances           = module.ec2_instances.id
# }
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
    matcher           = "200,301,302"
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