variable "function_name" {
  type = string
  default = "test-anagram_handler-function"
  description = "Name of the function"
}
variable "handler_name" {
  type = string
  default = "anagram"
  description = "Name of the handler function"
}
variable "timeout" {
  type = string
  default = "900"
  description = "Timeout"
}
variable "bucket_name" {
  type = string
  default = "rakib1-anagram-fd-testing"
  description = "Name of the bucket"
}

variable "runtime" {
  type = string
  default = "python3.7"
  description = "Runtime"
}

variable "aws_profile" {
  type = string
  default = ""
  description = "Name of configured AWS profile to use for Lambda provision"
}

variable "aws_region" {
  type = string
  default = "ap-southeast-1"
  description = "Region where to provision Lambda"
}

variable "stage_name" {
  type = string
  default = ""
  description = "Env Stage"
}
