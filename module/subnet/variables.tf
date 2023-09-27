variable "vpc_id_for_subnet" {
    type = string
}

variable "user_names" {
  type    = list(string)
  default = ["user1", "user2", "user3"]
}