# My Slackbot

My Slackbot is a Python application that helps users interact with Slack in a fun and efficient way. It is built using the Slack API and is designed to be easily extensible and customizable.

One of the main features of My Slackbot is its ability to scrape new messages in a channel, vectorize the messages using natural language processing techniques, store the vectors in a RDS, and compare the vectors to find the closest match. This can be useful for tasks such as analyzing the sentiment of messages, tracking discussions, or extracting data from messages.
## Directory Structure
The project is organized into the following directories:

```
├── infrastructure/
│   ├── poller/
│   ├── networking/
│   ├── functions/
│   ├── queue/
│   ├── storage/
│   ├── artifact_registry/
│   ├── variables.tf
│   ├── output.tf
│   └── main.tf
├── code/
│   ├── poller/
│   ├── function1/
│   ├── function2/
│   ├── function3/
│   ├── function4/
│   ├── function5/
│   ├── poller.Dockerfile
│   ├── .gitlab-ci.yml
│   ├── requirements.txt
│   └── README.md
├── settings.env
├── .gitignore              # Files and directories to ignore when 
└── README.md
```
The **`infrastructure/`** directory contains the code and configuration for the infrastructure of the project, such as deployment scripts, networking configurations, and security policies. The **`code/`** directory contains the source code for the application, including the main application code (in the **`app/`** directory), and tests (in the **`tests/`** directory).

The **`Dockerfile`** in the **`code/`** directory defines the steps for building a Docker image for the application. The **`.gitlab-ci.yml`** file defines the CI pipeline for the project, including the steps for building, testing, and deploying the application. The **`requirements.txt`** file lists the Python packages that are required for the application.

The **`settings.env`** file defines settings for the build system, such as the root project name and the names of any subprojects.

The **`README.md`** file in the root directory provides information about the main project, including an overview of the infrastructure and code subdirectories and any instructions for building and running the application.

### Infrastructure
**`poller/`**
This directory contains the Terraform configuration files and settings for the EC2 instance.
The Terraform configuration files in this directory use the following variables:

- `ec2_instance_type`: The type of the EC2 instance (e.g. t2.micro)
- `ec2_key_pair`: The name of the AWS key pair (e.g. my-key-pair)
- `ec2_public_key`: The public key to be used for the EC2 instance (e.g. ssh-rsa AAAAB3NzaC1yc2EAAA...)

**`artifact_registry/`**
This directory contains the Terraform configuration files and settings for the ECR artifact registry.
The Terraform configuration files in this directory use the following variables:

- **`ecr_repository_name`**: The name of the ECR repository (e.g. my-repository)

**`functions/`**
This directory contains the Terraform configuration files and settings for the AWS Lambda functions.
The Terraform configuration files in this directory use the following variables:

- `lambda_functions`: A list of names/settings for the Lambda functions (e.g. [`{"function_name":"my_function1","filename":"function1.zip"}`,`{  "function_name":"my_function2","filename":"function2.zip"}`])
- `lambda_function_deployment_packages`: A list of paths to the deployment packages for the Lambda functions (e.g. ["function1.zip", "function2.zip"])

**`networking/`**
This directory contains the Terraform configuration files and settings for the networking including the VPC, subnets, and security groups, api-gateway.
The Terraform configuration files in this directory use the following variables:

- `vpc_cidr_block`: The CIDR block for the VPC (e.g. 10.0.0.0/16)
- `public_subnet_cidr_blocks`: A list of CIDR blocks for the public subnets (e.g. ["10.0.1.0/24", "10.0.2.0/24"])
- `private_subnet_cidr_blocks`: A list of CIDR blocks for the private subnets (e.g. ["10.0.3.0/24", "10.0.4.0/24"])

**`queue/`**
This directory contains the Terraform configuration files and settings for  the SQS queue.
The Terraform configuration files in this directory use the following variables:
- `sqs_queue_name`: The name of the SQS queue (e.g. my-queue)
- `sqs_visibility_timeout`: The visibility timeout of the SQS queue, in seconds (e.g. 60)

**`storage/`**
This directory contains the Terraform configuration files and settings for the RDS instance.

 The Terraform configuration files in this directory use the following variables:
   - `rds_instance_class`: The instance class of the RDS instance (e.g. db.t2.micro)
   - `rds_username`: The username for the RDS instance
   - `rds_password`: The password for the RDS instance
These variables can be set either in a terraform.tfvars file or as environment variables.
## Git Strategy 
We want to use `MainLine` strategy:
- The mainline branch is the primary branch of the repository, and it should always be in a stable and deployable state.
- All development work is done in feature branches that are created from the mainline. Feature branches should be short-lived and should be merged back into the mainline as soon as they are ready. ( naming convention: `feature/<general_feature_description>`)
- When changes are ready to be merged into the mainline, they should be reviewed and tested by other team members before being merged. (open merge request)
- The mainline should be merged into other long-lived branches (such as a release branch) only when the changes are ready to be released.
- The mainline should be used for continuous integration, with automated tests running on each commit to ensure that the code is always in a deployable state.

## Continuous Integration and Continuous Delivery
This repository is set up for continuous integration (CI) and continuous delivery (CD) using GitLab CI.
### Continuous Integration
Continuous integration is the process of automatically building and testing code changes. In this repository, GitLab CI is used to build and test the code every time a commit is pushed to the repository.

The configuration for the CI process is defined in the .gitlab-ci.yml file at the root of the repository. This file specifies the jobs that should be run, the dependencies between jobs, and the environment in which the jobs should be run.

To trigger a CI build and test, simply push a commit to the repository. The build and test results will be displayed in the GitLab UI and notifications can be configured to be sent to team members.

**To test environment use Vagrant.**

### Continuous Delivery
Continuous delivery is the process of automatically releasing code changes to production. In this repository, GitLab CI is used to deploy code changes to lambda whenever a new release is created.

The process for creating a release is as follows:

Create a new branch for the release from the master branch.
Make any necessary code changes and commit them to the release branch.
Create a merge request from the release branch to the master branch.
Review and merge the merge request.
Tag the master branch with a new version number (e.g. v1.0.0).
GitLab CI will automatically detect the new tag and deploy the code to production.
The configuration for the CD process is also defined in the .gitlab-ci.yml file. The file specifies the jobs and environment for deploying the code to production.

For more information about GitLab CI and CD, you can refer to the [GitLab CI documentation](https://docs.gitlab.com/ee/ci/).

## Setup Environment
1. Clone the repository:
    ```
    git clone https://github.com/user/my-slackbot.git
    ```
2. Install the required dependencies:
    ```
    pip install -r requirements.txt
    ```
3. Create a Slack bot and obtain the API token:
    - Go to https://api.slack.com/apps and click "Create New App"
    - Give your app a name and select a development workspace
    - Under "Add features and functionality", click "Bots" and then "Add a Bot User"
    - Click "Install App" and follow the instructions to install the app to your development workspace
    - Copy the API token (starts with "xoxb-") and save it in a secure location
4. Get RDS instance settings from output:
    Make note of the hostname, port, username, and password for the RDS instance from terraform output.
5. Set the **`SLACK_BOT_TOKEN`** and **`RDS`** connection environment variables:
    ```
    export SLACK_BOT_TOKEN=xoxb-your-api-token
    export RDS_HOST ...
    ```

## Installation
#### Usage
1. Initialize the Terraform working directory:
    ```
    export ENV=<env_name>
    terraform init
    ```
2. Preview the changes that will be made by the Terraform configuration:
    ```
    terraform plan -var-file=$ENV.tfvars
    ```
3. Apply the changes to create the EC2 instance:
    ```
    terraform apply -var-file=$ENV.tfvars
    ```
## Architecture 

![alt text](./architecture.png)

## UML
                           +--------+   +--------+   +--------+
                           |        |   |        |   |        |
                           | Start  |-->| Step 1 |-->|  End   |
                           |        |   |        |   |        |
                           +--------+   +--------+   +--------+

## Technology
```bash
- Terraform  # Infrastructure
- Vagrant    # Environment Test and deploy to EC2
- Waypoint   # To deploy code in Lambda
- Prometheus # Scrape metrics
- gitlab-ci  
- python
- Lambda
- Api Gateway
- EC2
- RDS
- SQS
```
## License

```License
MIT License

Copyright (c) 2023 Develeap

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```