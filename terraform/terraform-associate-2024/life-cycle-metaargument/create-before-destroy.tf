# provider "aws" {
#   region     = "us-east-2"
# }

resource "aws_instance" "duplicate" {
  ami           = "ami-0862be96e41dcbf74"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  lifecycle {
    create_before_destroy = true
  }

}