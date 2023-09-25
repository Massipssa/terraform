resource "aws_launch_template" "launch_template" {
  // todo
  name_prefix   = "foobar"
  image_id      = var.ami
  instance_type = "t2.micro"

  tags = {
    Name = "alb-test"
  }

}

resource "aws_autoscaling_group" "autoscaling_group" {
  availability_zones = var.azs
  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size

  launch_template {
    id      = aws_launch_template.launch_template.id
    version = "$Latest"
  }
}