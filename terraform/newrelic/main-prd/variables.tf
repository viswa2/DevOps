variable "newrelic_admin_api_key" {
  description = "New Relic ADMIN API key to provision alerts and other changes"
}

variable "newrelic_user_api_key" {
  description = "New Relic PERSONAL API key for NerdGraph"
}

variable "newrelic_account_id" {
  description = "Account ID for aws-main Monitoring"
  default     = "3468036"
}

variable "enabled" {
  default = "true"
}

variable "monitor_names" {
  type = list(string)
  default = [
    "[prd] CCC Health",
    "[prd] Example Health",
    "[prd] Test Health"
  ]
}

variable "urls" {
  type = list(string)
  default = [
    "www.health.com",
    "www.example.com",
    "www.test.com"
  ]
}

variable "path_module" {
  type    = string
  default = "./"
}
