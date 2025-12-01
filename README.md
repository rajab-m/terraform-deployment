# Terraform Deployment for WordPress

Automated deployment of a WordPress website using Terraform.  
This repository defines the infrastructure and scripts required to provision a server and install WordPress.

---

## Repository Structure

.
├── main.tf # Main Terraform configuration.
├── variables.tf # Input variables for the Terraform project.
├── outputs.tf # Output values from Terraform.
├── modules/ # Reusable Terraform modules (e.g., network, compute).
├── install_wordpress.sh.tpl # Template script to install WordPress.
└── .gitignore # Files/folders to ignore in Git.

---

## Setup & Deployment

1. **Clone the repository**
```bash
git clone https://github.com/rajab-m/terraform-deployment.git
cd terraform-deployment

1. **Initialize Terraform
```bash
terraform init


2. **Review the plan
```bash
terraform plan


3. **Apply the configuration
```bash
terraform apply


4. **Destroy resources (if needed)**
```bash
terraform destroy

> **Note:** Sensitive data such as cloud provider credentials, database passwords, or SSH keys **should not be stored in the repository**.  
> These values must be provided **at runtime** via environment variables, `terraform.tfvars`, or input prompts during `terraform apply`.
