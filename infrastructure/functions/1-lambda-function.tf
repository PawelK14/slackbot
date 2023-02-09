data "archive_file" "python_lambda_package1" {
  type        = "zip"
  source_file = var.lambda_functions[0].filename
  output_path = var.lambda_function_deployment_packages[0]
}

resource "aws_lambda_function" "slackbot-lambda-function1" {
    function_name    = var.lambda_functions[0].function_name
    
    filename         = var.lambda_function_deployment_packages[0]
    source_code_hash = data.archive_file.python_lambda_package1.output_base64sha256
    role             = aws_iam_role.lambda_role.arn
    runtime          = "python3.9"
    handler          = var.lambda_functions[0].handler
    timeout          = 10 
}