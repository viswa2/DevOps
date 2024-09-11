provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "my-ec2" {
  ami           = "ami-085f9c64a9b75eed5"
  instance_type = "t2.micro"
}

output "instance_id" {
  value = aws_instance.my-ec2.id
}