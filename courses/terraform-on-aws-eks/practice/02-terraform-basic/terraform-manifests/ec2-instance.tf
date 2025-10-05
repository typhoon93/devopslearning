# Terraform settings block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}


# providers block
provider "aws" {
  profile="default"
  region = "eu-north-1"
}

# resource block
resource "aws_instance" "ec2demo" {
  ami = "ami-04c08fd8aa14af291" // comment 1
  instance_type = "t3.nano"

}