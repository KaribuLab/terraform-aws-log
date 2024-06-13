output log_arn {
  value       = aws_cloudwatch_log_group.log.arn
  description = "The ARN of the CloudWatch Log Group"
}

output log_name {
  value       = aws_cloudwatch_log_group.log.name
  description = "The name of the CloudWatch Log Group"
}
