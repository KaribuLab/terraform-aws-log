output log_arn {
  value       = aws_cloudwatch_log_group.logs.arn
  description = "The ARN of the CloudWatch Log Group"
}

output log_name {
  value       = aws_cloudwatch_log_group.logs.name
  description = "The name of the CloudWatch Log Group"
}
