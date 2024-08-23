variable "store_id" {
  type = string
  default = "identtity store id of IAM identity center"
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

