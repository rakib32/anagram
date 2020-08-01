
variable "lambda_iam_name" {
  type = string
  default = "rakib-terraform"
  description = "Name of IAM for Lambda"
}

variable "stage_name" {
  type = string
  default = "stage"
  description = "Env Stage"
}

variable "lambda_iam_user" {
  type = string
  default = "rakib-terraform"
  description = "Name of the AWS user"
}
