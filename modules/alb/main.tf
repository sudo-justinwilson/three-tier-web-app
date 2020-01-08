resource "aws_lb" "three-tier-alb" {
  name               = "three-tier-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = ["${aws_security_group.three-tier-alb-sg.id}", "${var.vpc_security_group_id}"]

  subnets = var.vpc_public_subnets

  tags = {
    Name        = "three-tier-alb"
    Environment = "dev"
  }
}

resource "aws_alb_target_group" "three-tier-target-group" {
  name     = "ecs-target-group"
  port     = "80"
  protocol = "HTTP"

  vpc_id = var.vpc_id

  health_check {
    healthy_threshold   = "5"
    unhealthy_threshold = "10"
    interval            = "121"
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = "120"
  }

  tags = {
    Name = "ecs-target-group"
  }
}

resource "aws_alb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.three-tier-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.three-tier-target-group.arn
    type             = "forward"
  }
}



resource "aws_security_group" "three-tier-alb-sg" {

  name        = "three-tier-alb-sg"
  description = "Security group for three-tier alb."
  vpc_id = var.vpc_id

  ingress {
    description = "Allow all traffic from instance security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    security_groups = ["${var.vpc_security_group_id}"]
  }

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
  egress {
    # allow all traffic to public SN
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
  tags = {
    Name = "three-tier-alb-sg"
  }
}
