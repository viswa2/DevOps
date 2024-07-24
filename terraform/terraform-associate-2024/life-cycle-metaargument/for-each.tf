 provider "aws" {
    region = "us-east-2"
 }

resource "aws_key_pair" "example" {
  for_each = {
    key1 = "key1"
    key2 = "key2"
  }
  key_name   = each.value
  public_key = file("${path.module}/key.pub")
}

resource "aws_instance" "ec2-instance" {
  ami = "ami-00db8dadb36c9815e"
  for_each  = {
    key1 = "t2.micro"
    key2 = "t2.medium"
  }
  instance_type = each.value
  key_name      = aws_key_pair.example[each.key].key_name  # Reference the created key pairs
  tags = {
    Name = each.value
  }
}
