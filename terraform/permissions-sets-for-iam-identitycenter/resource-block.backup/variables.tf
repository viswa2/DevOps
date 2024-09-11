variable "instance_arn" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "store_id" {
  type = string
}

variable "users" {
  type = map(object({
    display_name = string
    user_name    = string
    given_name   = string
    family_name  = string
    email        = string
  }))
  default = {
    "viswa" = {
      display_name = "Viswa"
      user_name    = "viswa"
      given_name   = "Viswa"
      family_name  = "Nayak"
      email        = "viswa@gmail.com"
    }
    "viswanath" = {
      display_name = "Viswanath"
      user_name    = "viswanath"
      given_name   = "Viswanath"
      family_name  = "Reddy"
      email        = "viswanathreddy2608@gmail.com"
    }
  }
}

variable "groups" {
  type = map(object({
    display_name = string
    description  = string
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

variable "group_memberships" {
  type = map(list(string))
  default = {
    "developer" = ["viswa", "viswanath"]
    "testers"   = ["viswanath", "viswa"]
  }
}
