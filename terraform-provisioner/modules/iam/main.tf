# IAM
resource "aws_iam_role" "lambda_iam" {
  name = var.lambda_iam_name
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        Effect: "Allow",
        Action: "sts:AssumeRole",
        Principal: {
          "Service": "lambda.amazonaws.com"
        },
        Sid: ""
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "bucket_policy" {
  users = [
    var.lambda_iam_user]
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  name = "bucket_policy"
  depends_on = [
    aws_iam_role.lambda_iam
  ]
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  roles = [
    aws_iam_role.lambda_iam.name]
  users = [
    var.lambda_iam_user]
  policy_arn = "arn:aws:iam::aws:policy/AWSLambdaFullAccess"
  name = "lambda_policy"
  depends_on = [
    aws_iam_role.lambda_iam
  ]
}

resource "aws_iam_role_policy_attachment" "logs_policy" {
  role = aws_iam_role.lambda_iam.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
  depends_on = [
    aws_iam_role.lambda_iam
  ]
}

resource "aws_iam_role_policy_attachment" "lambda_eni_policy" {
  role = aws_iam_role.lambda_iam.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaENIManagementAccess"
  depends_on = [
    aws_iam_role.lambda_iam
  ]
}