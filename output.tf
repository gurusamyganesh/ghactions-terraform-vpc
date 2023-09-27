output "vpc_id123" {
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
  value = ["subnet-0425530fc874c9804","subnet-05968695b6a0e8377","subnet-01e41912ec0f13a0d"]
}