data "archive_file" "python_lambda_package2" {
  type        = "zip"
  source_file = var.lambda_functions[1].filename
  output_path = var.lambda_function_deployment_packages[1]
}

resource "aws_lambda_function" "slackbot-lambda-function2" {
    function_name    = var.lambda_functions[1].function_name
    
    filename         = var.lambda_function_deployment_packages[1]
    source_code_hash = data.archive_file.python_lambda_package2.output_base64sha256
    role             = aws_iam_role.lambda_role.arn
    runtime          = "python3.9"
    handler          = var.lambda_functions[1].handler
    timeout          = 10   
}