terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "<= 5.0"
    }
  }
}
provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example_Instance" {
  ami           = "ami-09efc42336106d2f2"
  instance_type = "t2.micro"

  tags = {
    Name = "myfirst-ec2-instance"
  }
}

