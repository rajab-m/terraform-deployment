# Terraform Deployment for WordPress

Automated deployment of a WordPress website using Terraform.  
This repository defines the infrastructure and scripts required to provision a server and install WordPress.

---

## Setup & Deployment

1. **Clone the repository**
```bash
git clone https://github.com/rajab-m/terraform-deployment.git
cd terraform-deployment
---
2. **Initialize Terraform**
```bash
terraform init
---
3. **Review the plan**
```bash
terraform plan
---
4. **Apply the configuration**
```bash
terraform apply
---
5. **Destroy resources (if needed)**
```bash
terraform destroy
---
> **Note:** Sensitive data such as cloud provider credentials, database passwords, or SSH keys **should not be stored in the repository**.  
> These values must be provided **at runtime** via environment variables, `terraform.tfvars`, or input prompts during `terraform apply`.
