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

# K8s, Aws, TF

- ALB Ingress Target type:  IP mode, it will route traffic directly to the pod; required in STICKY sessions to work with ALBs
  - "...io/target-type: ip"

## EFS CSI Driver
- efs needs to be created first, then the EFS csi driver can use it k8s
  - Ensure the EFS has mount targets in each AZ your EKS nodes run in.
  - Pass the filesystem ID into your PersistentVolume or StorageClass definition.
  - efs is created through your tf configs
  - k8s pvc and storage class: the size of the volume does not effect the actual usable space in EFS (as it is elastic) so we only set it because it is required by the template of 
- Dynamic provisioning: uses a PVC; we do not need to create a PV first manually. On the other hand, STORAGE CLASS has additonal params that need to be filled. 
- this is in contrast to EBS that could be created automatically by its driver.
