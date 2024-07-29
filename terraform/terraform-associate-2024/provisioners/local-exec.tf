provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "local_provisioner" {
  ami           = "ami-00db8dadb36c9815e"
  instance_type = "t2.nano"

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ips.txt"

  }
}