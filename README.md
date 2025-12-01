# Terraform Deployment for WordPress

Automated deployment of a WordPress website using Terraform.  
This repository defines the infrastructure and scripts required to provision a server and install WordPress.

---

## Setup & Deployment

1. **Clone the repository**
```
git clone https://github.com/rajab-m/terraform-deployment.git
cd terraform-deployment
```

2. **Initialize Terraform**
```
terraform init
```

3. **Review the plan**
```
terraform plan
```

4. **Apply the configuration**
```
terraform apply
```

5. **Destroy resources (if needed)**
```
terraform destroy
```
> **Note:** Sensitive data such as cloud provider credentials, database passwords, or SSH keys **should not be stored in the repository**.  
> These values must be provided **at runtime** via environment variables, `terraform.tfvars`, or input prompts during `terraform apply` as i did in this project.
