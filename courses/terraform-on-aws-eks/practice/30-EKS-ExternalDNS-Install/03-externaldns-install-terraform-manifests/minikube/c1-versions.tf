# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    helm = {
      source = "hashicorp/helm"
      #version = "2.5.1"
      #version = "~> 2.5"
      version = "~> 2.9"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      #version = "~> 2.11"
      version = ">= 2.20"
    }      
  }
}
