# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.7"
      version = ">= 2.20"
    }    
  }
}
