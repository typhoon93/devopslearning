## TF Commands Flow
```bash
terraform init # initilizes working dir, downloads providers
terraform validate # syntactic validity + internally consistent
terraform plan # creates an execution plan
terraform apply # applies the plan
terraform destroy # destroy the whole tf infra
```
```bash
#!/bin/bash
# -----------------------------------------
# 🌍 Terraform Command Cheat Sheet
# -----------------------------------------

# --- Core Commands ---
terraform init        # Initialize working dir, download providers/modules
terraform validate    # Check syntax + internal consistency
terraform plan        # Show execution plan (what will change)
terraform apply       # Apply changes (build/update infra)
terraform destroy     # Destroy all managed infrastructure

# --- State Management ---
terraform state list              # List resources in state
terraform state show <resource>   # Show details of specific resource
terraform refresh                 # Sync state file with real infra / terraform apply -refresh-only
terraform output                  # Display output values
terraform taint <resource>        # Mark resource for recreation
terraform untaint <resource>      # Remove taint flag

# --- Remote State Backend (S3 + DynamoDB) ---
# backend "s3" {
#   bucket         = "my-tf-state"          # S3 bucket for remote state
#   key            = "env/dev/terraform.tfstate"
#   region         = "us-east-1"
#   dynamodb_table = "terraform-locks"      # Used for state locking
#   encrypt        = true
# }

# DynamoDB table info:
#   Table name: terraform-locks
#   Primary key: LockID (string)
#   Purpose: Prevent concurrent terraform apply operations

# --- Workspace & Formatting ---
terraform fmt                       # Auto-format .tf files
terraform workspace list            # List workspaces
terraform workspace new <name>      # Create new workspace
terraform workspace select <name>   # Switch workspace

# --- Misc Commands ---
terraform show      # Display human-readable state or plan
terraform graph     # Output dependency graph (DOT format)
terraform version   # Show Terraform version info

# --- Common Workflow ---
terraform init
terraform validate
terraform plan
terraform apply
terraform output
```

# Helm
Helm is a package manager for k8s. Think of it like PIP.