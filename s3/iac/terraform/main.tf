terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

# configure the aws provider
provider "aws" {
  region = "ap-northeast-1"
}