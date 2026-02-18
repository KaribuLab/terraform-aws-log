# Copyright 2026 KaribuLab
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 6.7.0"
    }
  }
}

resource "aws_cloudwatch_log_group" "logs" {
  name              = var.for_lambda ? "/aws/lambda/${var.log_name}" : var.log_name
  retention_in_days = var.retention_in_days
  tags              = var.common_tags
}

resource "aws_cloudwatch_log_metric_filter" "logs" {
  count          = length(var.metrics_filter)
  name           = var.metrics_filter[count.index].name
  pattern        = var.metrics_filter[count.index].pattern
  log_group_name = aws_cloudwatch_log_group.logs.name

  metric_transformation {
    name      = var.metrics_filter[count.index].metric_name
    namespace = var.metrics_namespace
    value     = var.metrics_filter[count.index].value != null ? var.metrics_filter[count.index].value : "1"
    unit      = var.metrics_filter[count.index].unit
  }
}
