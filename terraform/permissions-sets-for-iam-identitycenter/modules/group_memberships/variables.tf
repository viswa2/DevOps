variable "store_id" {
  type = string
  default = "identtity store id of IAM identity center"
}

variable "group_ids" {
  type = map(string)
}

variable "user_ids" {
  type = map(string)
}

variable "group_memberships" {
  type = map(list(string))
}

