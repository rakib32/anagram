##################
# Creating lambda_anagram module
##################
module "lambda_anagram" {
  source = "../modules/lambda_anagram"
  stage_name = var.stage_name
}