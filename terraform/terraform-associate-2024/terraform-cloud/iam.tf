provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "lb" {
  name = "loadbalancer"
  path = "/system/"
}