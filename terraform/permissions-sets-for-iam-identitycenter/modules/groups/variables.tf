variable "store_id" {
  type    = string
  default = "d-9067ebe7bd"
}

variable "groups" {
  type = list(object({
    display_name = string
    description  = optional(string)
  }))
  description = "List of groups to create"
}
