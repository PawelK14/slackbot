variable "region" {
	type = string
}

variable "project" {
	type = string
}

variable "lambda_functions" {
	type = list
}

variable "lambda_function_deployment_packages" {
	type = list
}

variable "api_name" {
	type = string
}

variable "api_stage_name" {
	type = string
}

variable "function1_name" {
	type = string
}

variable "function2_name" {
   	type = string 
}

variable "cidr" {
 	type = string   
}

variable "db_name" {
	type = string
}

variable "username" {
	type = string
}

variable "password" {
    type = string
}