resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 70
  alarm_description   = "This alarm triggers when CPU > 70%"
  actions_enabled     = true

  alarm_actions = [aws_sns_topic.scale_notifications.arn]

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.main.name
  }
}