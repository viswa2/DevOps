provider "newrelic" {
  account_id    = var.newrelic_account_id
  admin_api_key = var.newrelic_admin_api_key
  api_key       = var.newrelic_user_api_key
  region        = "EU"
}

terraform {
  #required_version = "0.13.6"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = "2.47.1"
    }
  }
}

