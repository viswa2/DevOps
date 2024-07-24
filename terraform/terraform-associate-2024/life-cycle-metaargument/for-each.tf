 provider "aws" {
    region = "us-east-2"
 }

resource "aws_instance" "ec2-instance" {
  ami = "ami-00db8dadb36c9815e"
  for_each  = {
      key1 = "t2.micro"
      key2 = "t2.medium"
   }
  instance_type    = each.value
  key_name         = each.key
  tags =  {
   Name = each.value
    }
}