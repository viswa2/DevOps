terraform {
  backend "s3" {
    bucket = "demo-backend-terraform"
    key    = "network/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "remote-state-lock"
  }
}
