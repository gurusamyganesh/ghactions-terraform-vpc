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
  availability_zone = "us-east-2a"

  tags = {
    Name = "Private Subnet"
  }
}

output "subnet_id123" {
  value = aws_subnet.private_subnet.id
}

resource "null_resource" "users" {
  for_each = toset(var.user_names)

  triggers = {
    name = each.value
  }
}

output "user_names_output" {
  value = [for user in null_resource.users : user.triggers.name]
}