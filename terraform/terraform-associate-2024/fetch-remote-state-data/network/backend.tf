terraform {
  backend "s3" {
    bucket = "demo-backend-terraform"
    key    = "eip.tfstate"
    region = "us-east-2"
  }
}