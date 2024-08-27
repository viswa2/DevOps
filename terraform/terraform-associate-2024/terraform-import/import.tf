provider "aws" {
  region = "us-east-2"
}

import {
  to = aws_security_group.mysg
  id = "sg-0dd1bd5484b8c30c6"
}