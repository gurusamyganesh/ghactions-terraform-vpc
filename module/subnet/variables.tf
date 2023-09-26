variable "public_subnet_numbers" {
  type = map(number)
 
  description = "Map of AZ to a number that should be used for public subnets"
 
  default = {
    "us-east-2a" = 1
    "us-east-2b" = 2
    "us-east-2c" = 3
  }
}

variable "vpc_id" {
    type = string
}