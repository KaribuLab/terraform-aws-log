# Terraform AWS Log

This module creates a straightforward Cloudwatch Log Group.

## Inputs

| Name              | Type        | Description                                                       | Required |
| ----------------- | ----------- | ----------------------------------------------------------------- | -------- |
| log_name          | string      | Log group name                                                    | yes      |
| for_lambda        | bool        | Set log group name in namespace `/aws/lambda` **(default: true)** | no       |
| retention_in_days | number      | Logs retention in days **(default: 30)**                          | no       |
| common_tags       | map(string) | Common tags for components                                        | yes      |

## Outputs

| Name     | Type   | Description    |
| -------- | ------ | -------------- |
| log_arn  | string | Log group ARN  |
| log_name | string | Log group name |