###############
# fetching current account id
###############
data "aws_caller_identity" "current" {}

###############
# User to perform aws operations
###############

data "aws_iam_user" "terraform_user" {
  user_name = var.lambda_iam_user
}
