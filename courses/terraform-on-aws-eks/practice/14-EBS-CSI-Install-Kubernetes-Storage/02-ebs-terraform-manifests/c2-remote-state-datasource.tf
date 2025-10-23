# Terraform Remote State Datasource - Remote Backend AWS S3
data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket = "terraform-on-aws-eks-2025"
    key    = "dev/eks-cluster/terraform.tfstate"
    region = var.aws_region
  }
}