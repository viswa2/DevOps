variable "group_memberships" {
  type        = map(list(string))
  description = "Map of group names to list of user names"
}

variable "store_id" {
  type    = string
  default = "d-9067ebe7bd"
}

variable "group_ids" {
  type        = map(string)
  description = "Map of group names to their IDs"
}

variable "user_ids" {
  type = map(string)
}

