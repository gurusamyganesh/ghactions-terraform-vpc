resource "aws_subnet" "private" {
  for_each = var.private_subnet_numbers
 
  vpc_id            = aws_vpc.vpc.id
  availability_zone = each.key
 
  # 2,048 IP addresses each
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)
 
  tags = {
    Name        = "cloudcasts-${var.infra_env}-private-subnet"
    Project     = "cloudcasts.io"
    Role        = "private"
    Environment = var.infra_env
    ManagedBy   = "terraform"
    Subnet      = "${each.key}-${each.value}"
  }
}

output "subnet_id123" {
  value = aws_subnet.private.id
}