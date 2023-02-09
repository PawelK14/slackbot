data "archive_file" "python_lambda_package4" {
  type        = "zip"
  source_file = var.lambda_functions[3].filename
  output_path = var.lambda_function_deployment_packages[3]
}

resource "aws_lambda_function" "slackbot-lambda-function4" {
    function_name    = var.lambda_functions[3].function_name
  
    filename         = var.lambda_function_deployment_packages[3]
    source_code_hash = data.archive_file.python_lambda_package4.output_base64sha256
    role             = aws_iam_role.lambda_role.arn
    runtime          = "python3.9"
    handler          = var.lambda_functions[3].handler
    timeout          = 10
}