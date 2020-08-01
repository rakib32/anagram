module "iam" {
  source = "../iam"
}

resource "null_resource" "delay_before_bucket_creation" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  triggers = {
    "before" = module.iam.bucket_policy,
    "after" = module.iam.lambda_eni_policy
  }
}

resource "null_resource" "delay_before_lambda_creation" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  triggers = {
    "before" = module.iam.lambda_eni_policy
  }
}


resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "sleep 30"
  }
}

##################
# Creating s3 resource for invoking to lambda_anagram function
##################
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "private"
  tags = {
    Name = "Anagram fd Testing"
    Environment = var.stage_name
  }

  depends_on = [
    module.iam.bucket_policy,
    null_resource.delay_before_bucket_creation
  ]
}

###############
# Creating Lambda resource
################
resource "aws_lambda_function" "anagram_lambda" {
  function_name = var.function_name
  role = module.iam.lambda_iam
  handler = "${var.handler_name}.lambda_handler"
  runtime = var.runtime
  timeout = var.timeout
  filename = "${var.handler_name}.zip"
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256
  environment {
    variables = {
      CreatedBy = "Terraform"
    }
  }
  tags = {
    STAGE = var.stage_name
  }
  depends_on = [
    data.archive_file.lambda_zip,
    module.iam.lambda_eni_policy,
    module.iam.lambda_policy,
    module.iam.logs_policy,
    null_resource.delay_before_lambda_creation
  ]
}

resource "aws_lambda_permission" "allow_cloudwatch" {
  statement_id = "AllowS3Invoke"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.anagram_lambda.function_name
  principal = "s3.amazonaws.com"
  source_arn = "arn:aws:s3:::${aws_s3_bucket.bucket.id}"

  depends_on = [
    aws_lambda_function.anagram_lambda,
    aws_s3_bucket.bucket
  ]
}

##################
# Adding S3 bucket as trigger to my lambda_anagram and giving the permissions
##################
resource "aws_s3_bucket_notification" "aws-lambda-trigger" {
  bucket = aws_s3_bucket.bucket.id
  lambda_function {
    lambda_function_arn = aws_lambda_function.anagram_lambda.arn
    events = [
      "s3:ObjectCreated:*"]
    filter_prefix = "anagram"
    filter_suffix = ".csv"
  }
  depends_on = [
    aws_lambda_permission.allow_cloudwatch,
    null_resource.delay]
}

###########
# output of lambda_anagram arn
###########
output "arn" {
  value = aws_lambda_function.anagram_lambda.arn
}