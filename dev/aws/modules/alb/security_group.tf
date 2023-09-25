resource "aws_security_group" "lb_sg" {
  vpc_id = var.vpc_id
  name =  var.lb_security_group_name
  description = "Allow SSH and TLS inbound traffic"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}