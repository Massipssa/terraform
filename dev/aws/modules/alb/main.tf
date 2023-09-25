resource "aws_lb" "lb" {
  name               = var.lb_name
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = var.subnets

  //enable_deletion_protection = true

  /*
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    // todo
    prefix  = "test-lb"
    enabled = true
  }
  */
  tags = var.lb_tags
}

# Target Group
resource "aws_lb_target_group" "lb_target_group" {
  name     = "alb-TG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  tags = var.lb_tags
}

# aws_lb_listener
resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }

  tags = var.lb_tags
}