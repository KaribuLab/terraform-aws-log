resource "aws_cloudwatch_log_group" "log" {
  name = var.for_lambda ? "/aws/lambda/${var.log_name}" : var.log_name
  retention_in_days = var.retention_in_days
  tags = var.common_tags
}

resource "aws_cloudwatch_log_metric_filter" "logs" {
  count          = length(var.metrics_filter)
  name           = var.metrics_filter[count.index].name
  pattern        = var.metrics_filter[count.index].pattern
  log_group_name = aws_cloudwatch_log_group.logs.name

  metric_transformation {
    name          = var.metrics_filter[count.index].name
    namespace     = var.metrics_namespace
    value         = "1"
  }
}