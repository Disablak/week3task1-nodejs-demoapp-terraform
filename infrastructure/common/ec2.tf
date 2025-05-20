resource "aws_launch_template" "demoapp" {
  name_prefix   = "demoapp-"
  image_id      = var.ami_amazon_linux_id
  instance_type = var.instance_type
  user_data = base64encode(file("user_data.sh")) //file("${path.cwd}${var.path_to_user_data}")

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web.id]
  }
}
