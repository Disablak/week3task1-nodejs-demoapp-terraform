resource "aws_sns_topic" "scale_notifications" {
  name = "demoapp-scaling-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.scale_notifications.arn
  protocol  = "email"
  endpoint  = "verchinskiymax@gmail.com"
}

resource "aws_autoscaling_notification" "asg_notify" {
  group_names = [aws_autoscaling_group.asg.name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
  ]

  topic_arn = aws_sns_topic.scale_notifications.arn
}