output "lambda_iam" {
  value = aws_iam_role.lambda_iam.arn
}

output "bucket_policy" {
  value = aws_iam_policy_attachment.bucket_policy.id
}
output "lambda_policy" {
  value = aws_iam_policy_attachment.lambda_policy.id
}
output "logs_policy" {
  value = aws_iam_role_policy_attachment.logs_policy.id
}
output "lambda_eni_policy" {
  value = aws_iam_role_policy_attachment.lambda_eni_policy.id
}