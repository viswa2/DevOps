variable "store_id" {
  type    = string
  default = "d-9067ebe7bd"
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

variable "instance_arn" {
  type    = string
  default = "Instance ARN of IAM identity center" # Add instance ARN 
}

variable "aws_account_id" {
  type    = string
  default = "aws account id number" # Aws Account id
}

variable "name" {
  type    = string
  default = "Example-Permissionset"
}

variable "managed_policies" {
  description = "List of managed policy ARNs to attach to the permission set"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/PowerUserAccess"
  ]
}
