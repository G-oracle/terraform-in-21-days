terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket         = "terraform-remote-state-1610"
    key            = "terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "remote-state-lock"
  
  }
}

provider "aws" {
  region = "us-east-2"
}
