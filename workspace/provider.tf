terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.86.1"
    }
  }
  backend "s3" {
    bucket = "devops81s-remote-state-aws"
    key    = "workspaces"
    region = "us-east-1"
    dynamodb_table = "81s-locking-aws"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}