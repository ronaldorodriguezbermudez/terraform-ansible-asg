resource "aws_key_pair" "key_pair" {
  key_name   = "terraform-key"
  public_key = file("~/Documentos/GitHub/terraform-ansible-asg/terraform-key.pub")
}

resource "aws_launch_template" "lt" {
  name          = "asg-launch-template"
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.key_pair.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group_id]
  }
}



resource "aws_autoscaling_group" "asg" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "ASG-Instance"
    propagate_at_launch = true
  }
}