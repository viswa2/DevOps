data "terraform_remote_state" "vpc" {
  backend = "s3"

  config = {
    bucket = "demo-backend-terraform"
    key    = "eip.tfstate"
    region = "us-east-2"
    }
  }