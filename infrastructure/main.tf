module "functions" {
    source = "./functions"
    lambda_functions = var.lambda_functions
    lambda_function_deployment_packages = var.lambda_function_deployment_packages
}

module "networking" {
    source = "./networking"
    api_name = var.api_name
    api_stage_name = var.api_stage_name
    function1_invoke_arn = module.functions.lambda_function1_invoke_arn
    function2_invoke_arn = module.functions.lambda_function2_invoke_arn
    function1_name = var.function1_name
    function2_name = var.function2_name
    cidr = var.cidr
}

module "storage" {
    source = "./storage"
    db_name = var.db_name
    username = var.username
    password = var.password
}