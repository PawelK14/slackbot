data "archive_file" "python_lambda_package3" {
  type        = "zip"
  source_file = var.lambda_functions[2].filename
  output_path = var.lambda_function_deployment_packages[2]
}

resource "aws_lambda_function" "slackbot-lambda-function3" {
    function_name    = var.lambda_functions[2].function_name
    
    filename         = var.lambda_function_deployment_packages[2]
    source_code_hash = data.archive_file.python_lambda_package3.output_base64sha256
    role             = aws_iam_role.lambda_role.arn
    runtime          = "python3.9"
    handler          = var.lambda_functions[2].handler
    timeout          = 10 
}