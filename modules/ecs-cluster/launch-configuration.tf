# This pulls the ID for the latest ecs-optimized AMI image:
data "aws_ssm_parameter" "ecs-ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux/recommended/image_id"
}

resource "aws_launch_configuration" "ecs-launch-configuration" {
  name = "ecs-launch-configuration"

  image_id = data.aws_ssm_parameter.ecs-ami.value
  instance_type = var.ecs_instance_type
  iam_instance_profile = aws_iam_instance_profile.ecs-instance-profile.id

  root_block_device {
    volume_type           = "standard"
    volume_size           = 100
    delete_on_termination = true
  }

  lifecycle {
    create_before_destroy = true
  }

  security_groups             = [var.security_groups]
  associate_public_ip_address = "true"
  key_name  = var.ecs_key_pair_name
  user_data = <<EOF
                                  #!/bin/bash
                                  echo ECS_CLUSTER=${var.ecs_cluster} >> /etc/ecs/ecs.config
                                  EOF
}
