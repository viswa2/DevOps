######################################################################################################################################
# Challange:
# Earlier the old provider version available. We have upgraded by using terraform init -upgrade
# Earlier the code was not in correct format,by using terraform fmt to a canonical format and style.
# Earlier entire code was in one file we have segregated based on the requirements i.e providers.tf, tf-challange1.tf and variables.tf
# There is was a splunk port needs to modify while executing the terraform commands without manual modification.
# The splunk port was added from 8088 to 8089 in terraform.tfvars file. Right now not pushing to github repo due to some constraints.
#######################################################################################################################################

resource "aws_eip" "example" {
  domain = "vpc"
  tags = {
    name = "Testing EIP"

  }
}

resource "aws_security_group" "security_group_payment_app" {
  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example]

  # Below ingress allows HTTPS from DEV VPC
  ingress {
    from_port   = var.https_port
    to_port     = var.https_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_block]
  }
  # Below ingress allows APIs access from DEV VPC

  ingress {
    from_port   = var.http_port
    to_port     = var.http_port
    protocol    = "tcp"
    cidr_blocks = [var.ingress_cidr_block]
  }

  # Below ingress allows APIs access from Prod App Public IP.

  ingress {
    from_port   = var.ingress
    to_port     = var.ingress
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]
  }
  egress {
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = [var.egress_cidr_block]
  }

  tags = {
    name = "Payment app security group"
  }
}
