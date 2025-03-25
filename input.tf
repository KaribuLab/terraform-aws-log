variable log_name {
  type        = string
  description = "Log group name"
}

variable "for_lambda" {
  type        = bool
  default     = true
  description = "Whether the log group is for a Lambda function"
  
}

variable retention_in_days {
  type        = number
  default     = 30
  description = "Log retention in days"
}


variable common_tags {
  type        = map(string)
  description = "Common tags for all resources"
}

variable "metrics_namespace" {
  description = "The namespace to use for metrics"
  type        = string
  default = null
}

variable "metrics_filter" {
  description = "The filter pattern for extracting metric data out of ingested log events"
  default = []
  type = list(
    object({
      name      = string
      pattern   = string
  }))
}