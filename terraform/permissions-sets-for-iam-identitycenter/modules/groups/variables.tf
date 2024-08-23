variable "store_id" {
  type    = string
  default = ""identtity store id of IAM identity center"
}

variable "groups" {
  type = map(object({
    display_name = string
  }))

  default = {
    "developer" = {
      display_name = "Developers"
      description  = "This is all about Developer group details description"
    }
    "testers" = {
      display_name = "Testers"
      description  = "This is all about Testers group details description"
    }
  }
}

