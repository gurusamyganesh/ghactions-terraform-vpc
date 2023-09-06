provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "harc-redshift-testdata"
    key            = "terraformstate/terraform.tfstate"
    region         = "us-east-1"
  }
}

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "GithubActions-VPC-terraform"
 }
}