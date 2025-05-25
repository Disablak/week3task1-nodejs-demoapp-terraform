output "launch_template_id" {
  value = aws_launch_template.demoapp.id
}

output "ec2_sg_id" {
  value = aws_security_group.allow_http_and_ssh.id
}