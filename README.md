# Terraform AWS Log

This module creates a straightforward Cloudwatch Log Group with optional metric filters.

## Inputs

| Name              | Type        | Description                                                       | Required |
| ----------------- | ----------- | ----------------------------------------------------------------- | -------- |
| log_name          | string      | Log group name                                                    | yes      |
| for_lambda        | bool        | Set log group name in namespace `/aws/lambda` **(default: true)** | no       |
| retention_in_days | number      | Logs retention in days **(default: 30)**                          | no       |
| common_tags       | map(string) | Common tags for components                                        | yes      |
| metrics_namespace | string      | The namespace to use for metrics **(default: null)**              | no       |
| [metrics_filter](#metrics-filter) | list(object)| List of metric filters to create from log events **(default: [])** | no       |

### Metrics Filter

Each metric filter in the `metrics_filter` list should have the following structure:

| Name        | Type   | Description                                    |
| ----------- | ------ | ---------------------------------------------- |
| name        | string | Name of the metric filter                      |
| metric_name | string | Name of the resulting metric                   |
| pattern     | string | Filter pattern for extracting metric data      |
| value       | string | Value to use for the metric **(optional)**     |
| unit        | string | Unit of measurement for the metric **(optional)** |

## Outputs

| Name     | Type   | Description    |
| -------- | ------ | -------------- |
| log_arn  | string | Log group ARN  |
| log_name | string | Log group name |