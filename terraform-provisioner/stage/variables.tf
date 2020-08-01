
variable "aws_profile" {
  type = string
  default = "iam-terraform-user"
  description = "Name of configured AWS profile to use for Lambda provision"
}

variable "aws_region" {
  type = string
  default = "ap-southeast-1"
  description = "Region where to provision Lambda"
}

variable "lambda_iam_name" {
  type = string
  default = "rakib-terraform"
  description = "Name of IAM for Lambda"
}

variable "lambda_iam_user" {
  type = string
  default = "rakib-terraform"
  description = "Name of the AWS user"
}

variable "stage_name" {
  type = string
  default = "dev"
  description = "Env Stage"
}
