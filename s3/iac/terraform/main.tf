# https://registry.terraform.io/providers/hashicorp/aws/latest
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.89.0"
    }
  }
} 

provider "aws" {
  # Configuration options
}