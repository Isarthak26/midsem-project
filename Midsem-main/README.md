                                                                  # Midsem
                                                    Infrastructure as Code (IaC) with Terraform
# 🌍 Multi-Cloud Infrastructure Automation — Terraform + Docker + CI/CD

### 🚀 Overview
This project demonstrates a **multi-cloud, scalable, and modular infrastructure** built using **Terraform**, **Docker**, and **CI/CD pipelines** (Jenkins & Azure DevOps).

The goal is to enable seamless deployment of an **NGINX web application** (containerized and SSL-enabled) across **AWS** and **Azure**, while keeping the infrastructure **reusable**, **environment-agnostic**, and **easy to scale**.

---

## 🎯 Key Objectives

- Build reusable Terraform modules for compute, networking, and load balancers  
- Deploy to multiple environments (`dev`, `staging`, `prod`)  
- Support **both AWS and Azure** clouds  
- Containerize an **NGINX app** with **OpenSSL-based HTTPS**  
- Automate infra provisioning using **CI/CD pipelines**  
- Enable **centralized state management** and **safe concurrent deployments**

---

## 🧱 Architecture Overview

### 🧩 Core Components
| Layer | AWS | Azure | Description |
|-------|------|--------|-------------|
| Networking | VPC with public/private subnets | Virtual Network with subnets | Secure network segmentation |
| Compute | EC2 Instances | Azure Virtual Machines | Hosts the Dockerized NGINX app |
| Load Balancer | Application Load Balancer (ALB) | Application Gateway | Handles HTTPS traffic |
| NAT Gateway | NAT Gateway | NAT Gateway or Outbound Rule | Outbound internet access for private subnets |
| SSL | Self-signed via OpenSSL | Self-signed via OpenSSL | Enables HTTPS inside containers |
| CI/CD | Jenkins & GitHub Actions | Azure DevOps | Automates build and deploy |
| State Management | S3 + DynamoDB | Azure Storage Account | Centralized remote state and locking |

---



markdown
Copy code

---

## ⚙️ How It Works

1. **Terraform Modules**  
   Each module (network, compute, load balancer, nginx-app) is fully parameterized and reusable across environments and clouds.

2. **Multi-Environment Support**  
   - Separate folders (`dev`, `staging`, `prod`) each contain backend configs and environment-specific variables.  
   - You can deploy with:
     ```bash
     terraform workspace select dev
     terraform apply -var-file=environments/dev/terraform.tfvars
     ```

3. **Multi-Cloud Support**
   - Enable or disable clouds using variables:
     ```hcl
     variable "enable_aws"   { type = bool, default = true }
     variable "enable_azure" { type = bool, default = false }
     ```

4. **Dockerized NGINX App**
   - Uses `generate-ssl.sh` to create self-signed certs  
   - Runs on HTTPS (`443`), redirects HTTP → HTTPS  
   - Deployed via Terraform `user_data` or VM extensions

5. **CI/CD Pipelines**
   - Jenkins and Azure DevOps YAML pipelines automate:
     - Terraform init, plan, and apply
     - Docker image build and push
     - Environment-based deployments

6. **Remote State Management**
   - AWS: S3 bucket with DynamoDB for state locking  
   - Azure: Storage Account + Container for state  
   - Keeps deployments atomic and consistent across teams

---

## 🧰 Prerequisites

| Tool | Purpose | Install Command |
|------|----------|-----------------|
| Terraform ≥ v1.6 | Infrastructure provisioning | [Install Terraform](https://developer.hashicorp.com/terraform/downloads) |
| Azure CLI | Authenticate & manage Azure | `winget install Microsoft.AzureCLI` |
| AWS CLI | Authenticate to AWS | `pip install awscli` |
| Docker | Container runtime | [Install Docker](https://docs.docker.com/get-docker/) |
| Jenkins / Azure DevOps | CI/CD pipelines | Preconfigured on server |
| Git | Version control | `winget install Git.Git` |

---

## 🚀 Deployment Steps

### 🔹 Step 1: Clone Repository
```bash
git clone https://github.com/Isarthak26/devops-midsem.git
cd infra-repo
🔹 Step 2: Authenticate
bash
Copy code
# For Azure
az login

# For AWS
aws configure
🔹 Step 3: Initialize Terraform
bash
Copy code
cd environments/dev
terraform init
🔹 Step 4: Plan and Apply
bash
Copy code
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
🔹 Step 5: Verify Deployment
Once completed, Terraform will output:

ALB / App Gateway DNS name

Public or private IPs of deployed VMs
Visit:

cpp
Copy code
https://<aws-alb-dns>
https://<azure-appgw-dns>
(Expect a browser SSL warning — using self-signed certs)

🌐 CI/CD Pipelines
Jenkinsfile
Parameterized build with environment input

Stages:

Checkout code

Terraform init & plan

Manual approval

Terraform apply

Docker build & deploy

Azure DevOps Pipeline
YAML-based automation

Supports multi-environment deployments:

yaml
Copy code
parameters:
  - name: environment
    values: [ dev, staging, prod ]
🧩 Benefits of This Setup
✅ Cloud-Agnostic Design (AWS + Azure ready)

✅ Fully Modular & DRY Terraform Code

✅ Multi-Environment Ready (dev/staging/prod)

✅ Built-in CI/CD for automation

✅ Secure HTTPS via OpenSSL inside containers

✅ Scalable Compute Layer using count / for_each

✅ Centralized State & Locking for team safety

🧠 Troubleshooting
Issue	Possible Fix
Error: module not found	Check folder paths and relative source fields
Provider not configured	Ensure provider blocks exist for both AWS & Azure
State backend error	Verify backend credentials and storage permissions
SSL warning in browser	Expected (using self-signed certs)
Authentication failed	Run az login or aws configure again

📄 License
This project is released under the MIT License.
Feel free to fork, reuse, and adapt for learning or enterprise use.

👨‍💻 Author
Sarthak @Isarthak26
💼 Engineering Student | Aspiring DevOps Engineer | Cloud Infrastructure Enthusiast
🧠 Focused on automation, scalability, and open-source learning.



