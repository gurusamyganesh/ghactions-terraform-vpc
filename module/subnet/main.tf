provider "aws" {
  region = "us-east-2"
}

terraform {
  backend "s3" {
    bucket         = "harc-redshift-testdata"
    key            = "terraformstate/terraform-subnet.tfstate"
    region         = "us-east-1"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id_for_subnet
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Private Subnet"
  }
}

output "subnet_id123" {
  value = aws_subnet.private_subnet.id
}