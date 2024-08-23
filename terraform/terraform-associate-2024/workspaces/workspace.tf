 provider "aws" {
  region     = "us-east-2"
}

locals {
  instance_type = {
    default  = "t2.nano"
    dev      = "t2.micro"
    prod     = "m5.large"
  }
}

resource "aws_instance" "example_Instance" {
  ami           = "ami-0490fddec0cbeb88b"
  instance_type = local.instance_type[terraform.workspace]

  tags = {
    Name = "myfirst-ec2-instance"
  }
}