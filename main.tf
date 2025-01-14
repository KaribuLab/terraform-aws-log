resource "aws_cloudwatch_log_group" "log" {
  name = var.for_lambda ? "/aws/lambda/${var.log_name}" : var.log_name
  retention_in_days = var.retention_in_days
  tags = var.common_tags
}