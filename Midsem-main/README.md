                                                                  # Midsem
                                                    Infrastructure as Code (IaC) with Terraform
                                                    
Configuration structure of the files to ensure Maintainability and scalability
---
<img width="380" height="700" alt="configuration-structure" src="https://github.com/user-attachments/assets/f33dcc04-04fb-43a4-9c62-c78e392497a4" />

Terraform Modular Infrastructure for Azure
---
This repository contains Terraform code to deploy a modular infrastructure on Microsoft Azure. The configuration is designed to be reusable and maintainable, leveraging Terraform modules to manage different components of the infrastructure.
Project Structure
The project follows a standard Terraform module structure to promote reusability and separation of concerns.
environments/dev: This directory contains the root configuration for the development environment. It calls the reusable modules and defines the specific values for that environment.

modules: This directory contains the reusable modules for different parts of the infrastructure:

compute: Manages virtual machines.

loadbalancer: Manages the application gateway/load balancer.

networking: Manages virtual networks, subnets, and other networking components.

nginx: A module that appears to configure a web server.

Workflow
The standard Terraform workflow (init, plan, apply) is used to deploy and manage the infrastructure.

1. Initialize
The terraform init command is used to initialize the working directory, downloading provider plugins and configuring the backend.

2. Plan
The terraform plan command creates an execution plan, which lets you preview the changes Terraform plans to make to your infrastructure.

3. Apply
The terraform apply command executes the actions proposed in a Terraform plan to create, update, or destroy infrastructure.

After a successful apply, the defined outputs, such as the application URL, will be displayed.

This structure allows for easy management of different environments (e.g., dev, staging, prod) by creating new directories under environments and reusing the same modules.

<img width="1861" height="1157" alt="init" src="https://github.com/user-attachments/assets/94a97c8d-0621-4b9e-b6f2-26084d3aa7db" />

<img width="1919" height="1199" alt="plan" src="https://github.com/user-attachments/assets/473df304-6f51-46b5-bdfd-5afcc16e7529" />

<img width="1919" height="1197" alt="apply" src="https://github.com/user-attachments/assets/4202006e-1c64-47b6-a9d2-d219c596a60f" />

CI/CD Automation with Jenkins
---
A Jenkins pipeline automates the deployment of this Terraform infrastructure to Azure, providing a consistent and reliable process.

Pipeline Flow
The Terraform-Azure-Deployment pipeline automates the entire workflow through several key stages:

Checkout SCM: Pulls the latest code from the GitHub repository.

Login to Azure: Authenticates with Azure using secure credentials.

Terraform Init: Initializes the Terraform environment and downloads necessary providers.

Terraform Plan: Creates an execution plan to preview infrastructure changes.

Archive Plan for Review: Saves the plan as an artifact for manual review and auditing.

Apply Terraform Plan: Executes the plan to deploy changes, typically after manual approval.

Post Actions: Cleans the Jenkins workspace to prepare for the next run.

<img width="1919" height="1153" alt="jenkins-pipeline" src="https://github.com/user-attachments/assets/46be0b7f-b8fc-405b-a0a4-49f374d7b32b" />

<img width="1920" height="1200" alt="jenkins-output" src="https://github.com/user-attachments/assets/bea0572f-db65-40c8-9787-bf7cc0b6a976" />

CI/CD Automation with YAML Azure pipelines
---
Azure Pipelines YAML
The azure-pipelines.yml defines a two-stage workflow that runs on a Windows agent:

Plan Stage: Initializes Terraform, creates an execution plan, and saves it as an artifact.

Apply Stage: After manual approval, this stage downloads the plan and applies the infrastructure changes.

<img width="1920" height="1200" alt="yaml" src="https://github.com/user-attachments/assets/22825224-542f-4f6b-998c-e42f168ea5af" />

<img width="1919" height="1101" alt="yaml-codes" src="https://github.com/user-attachments/assets/b6a6d35c-1cab-45a2-8ed3-a03166999600" />

<img width="1918" height="1090" alt="yaml-service-connection" src="https://github.com/user-attachments/assets/7b674b96-b99a-4163-ac03-4ca318644294" />


