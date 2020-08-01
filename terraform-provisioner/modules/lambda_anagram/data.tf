
###############
# Creating source code zip
###############
data "archive_file" "lambda_zip" {
  type = "zip"
  source_file = "../../${path.root}/anagram.py"
  output_path = "${path.root}/${var.handler_name}.zip"

  depends_on = []
}