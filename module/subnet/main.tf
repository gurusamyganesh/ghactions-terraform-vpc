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
  map_customer_owned_ip_on_launch = "false"
  availability_zone = "eu-west-2a"
  tags {
    Name = "subnet for gitactions"
  }
}

output "subnet_id123" {
  value = aws_subnet.private_subnet.id
}