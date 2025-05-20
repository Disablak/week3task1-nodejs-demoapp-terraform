output "autoscaling_group_name" {
  value = aws_autoscaling_group.asg.name
}

output "DNS_name" {
  value = aws_lb.app.dns_name
}