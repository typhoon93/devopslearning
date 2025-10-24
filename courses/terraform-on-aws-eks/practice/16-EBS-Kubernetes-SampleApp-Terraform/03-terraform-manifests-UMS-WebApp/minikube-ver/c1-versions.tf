# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      #version = "~> 2.7.1"
      version = ">= 2.20"
    }     
  }
  # Adding Backend as S3 for Remote State Storage
}

