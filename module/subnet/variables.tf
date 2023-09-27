variable "vpc_id_for_subnet" {
    type = string
}

variable "vpc_id_for_subnet" {
  type = string
  default = "vpc-071eeee235e4605a9"
}

variable "user_names" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}