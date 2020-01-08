resource "aws_security_group" "three-tier-sg" {
  name        = "three-tier-sg"
  description = "This security group only allows traffic from sources in the same security group"

  vpc_id = var.vpc_id

  ingress {
    description = "Allow all traffic from inside the security group"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    self        = "true"
  }

  egress {
    description = "allow all traffic to the internet"
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = [
    "0.0.0.0/0"]
  }
  tags = {
    Name = "three-tier-sg"
  }