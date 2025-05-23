resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "high-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = var.alarm_treshold
  alarm_description   = "This alarm triggers when CPU > ${tostring(var.alarm_treshold)}%"
  actions_enabled     = true

  alarm_actions = [aws_sns_topic.scale_notifications.arn]

  dimensions = {
    AutoScalingGroupName = var.autoscale_group_name
  }
}

resource "aws_sns_topic" "scale_notifications" {
  name = "demoapp-scaling-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.scale_notifications.arn
  protocol  = "email"
  endpoint  = var.sns_email
}

resource "aws_autoscaling_notification" "asg_notify" {
  group_names =  [var.autoscale_group_name]//[aws_autoscaling_group.main.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
  ]

  topic_arn = aws_sns_topic.scale_notifications.arn
}
