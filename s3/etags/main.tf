terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_s3_bucket" "default" {
}

resource "aws_s3_object" "object" {
    bucket = aws_s3_bucket.default.id
    key = "myfile.txt"
    source = "myfile.txt"

    etag = filemd5("myfile.txt")
}