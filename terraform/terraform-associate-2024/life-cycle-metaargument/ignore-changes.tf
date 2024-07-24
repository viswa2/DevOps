provider "aws" {
  region     = "us-east-2"
}

resource "aws_instance" "myec2" {
    ami = "ami-00db8dadb36c9815e"
    instance_type = "t2.nano"

    tags = {
        Name = "HelloWorld" 
    }
    lifecycle {
      ignore_changes = all
    }
}
