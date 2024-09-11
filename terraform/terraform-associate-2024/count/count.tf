provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "my-instance" {
  ami           = "ami-0604d81f2fd264c7b"
  instance_type = "t2.nano"
  count         = 3
}