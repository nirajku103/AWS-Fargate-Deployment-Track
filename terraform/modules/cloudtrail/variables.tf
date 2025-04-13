variable "name" {
  description = "The name of the CloudTrail"
  type        = string
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for CloudTrail logs"
  type        = string
}

variable "include_global_service_events" {
  description = "Whether to include global service events"
  type        = bool
  default     = true
}

variable "is_multi_region_trail" {
  description = "Whether the trail is created in all regions"
  type        = bool
  default     = true
}

variable "enable_logging" {
  description = "Whether CloudTrail logging is enabled"
  type        = bool
  default     = true
}