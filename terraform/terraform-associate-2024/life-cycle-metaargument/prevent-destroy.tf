# provider "aws" {
#   region     = "us-east-2"
# }

resource "aws_instance" "prevent_destroy" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.micro"

    tags = {
        Name = "HelloWorld"
    }
    lifecycle {
      prevent_destroy = true
    }
}
