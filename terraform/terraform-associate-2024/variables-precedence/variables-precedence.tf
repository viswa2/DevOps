provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my-ec2" {
    instance_type = var.instance_type
    ami           = "ami-01b799c439fd5516a"
}