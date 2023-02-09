region = "eu-central-1"

project = "slackbot"

api_name = "slackbot-api"

api_stage_name = "slackbot-api-stage1"

function1_name = "slackbot-function1"

function2_name = "slackbot-function2"

cidr = "10.0.0.0/24"

db_name = "slackbot_db"

username = "slackbot"

password = "slackbot123"

lambda_functions = [{"function_name": "slackbot-function1", 
  "filename": "./../code/function1/function1.py",
  "handler": "function1.lambda_handler"
  },
   {"function_name": "slackbot-function2", 
   "filename": "./../code/function2/function2.py",
   "handler": "function2.lambda_handler"
   },
    {"function_name": "slackbot-function3", 
    "filename": "./../code/function3/function3.py",
    "handler": "function3.lambda_handler"
    },
     {"function_name": "slackbot-function4", 
     "filename": "./../code/function4/function4.py"
     "handler": "function4.lambda_handler"
     },
      {"function_name": "slackbot-function5", 
      "filename": "./../code/function5/function5.py"
      "handler": "function5.lambda_handler"}]

lambda_function_deployment_packages = ["./../code/function1/function1.zip", 
  "./../code/function2/function2.zip", 
  "./../code/function3/function3.zip", 
  "./../code/function4/function4.zip", 
  "./../code/function5/function5.zip",
  ]