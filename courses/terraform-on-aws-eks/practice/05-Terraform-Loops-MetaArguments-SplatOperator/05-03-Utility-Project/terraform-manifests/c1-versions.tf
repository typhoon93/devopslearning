# Terraform Block

terraform {
  required_version = "~> 1.13.3"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-east-1"
}


/*
Note-1:  AWS Credentials Profile (profile = "default") configured on your local desktop terminal  
$HOME/.aws/credentials
*/
