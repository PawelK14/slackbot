module "vpc_module" {
    source = "./modules/vpc_module"
    cidr = var.cidr
}
module "ec2_module" {
    source = "./modules/ec2_module"
    subnet_id = module.vpc_module.subnet_id
    vpc_security_group_ids = module.vpc_module.vpc_security_group_ids
}

module "api_gateway" {
    source = "./modules/api_gateway"
    api_name = var.api_name
    api_stage_name = var.api_stage_name
    function1_invoke_arn = var.function1_invoke_arn
    function2_invoke_arn = var.function2_invoke_arn
    function1_name = var.function1_name
    function2_name = var.function2_name
}
