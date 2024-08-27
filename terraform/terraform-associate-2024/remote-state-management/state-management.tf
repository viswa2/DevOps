provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-demo-ec2" {
  ami           = "ami-0490fddec0cbeb88b"
  instance_type = "t2.micro"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}

terraform {
  backend "s3" {
    bucket = "demo-backend-terraform"
    key    = "demo.tfstate"
    region = "us-east-2"
  }
}