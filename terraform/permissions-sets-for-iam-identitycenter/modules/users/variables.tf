variable "store_id" {
  description = "The ID of the Identity Store"
  type        = string
}

variable "users" {
  description = "List of users to create"
  type = map(object({
    display_name = string
    user_name    = string
    given_name   = string
    family_name  = string
    email        = string
  }))
}

