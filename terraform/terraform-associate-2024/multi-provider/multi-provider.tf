
provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias  = "mumbai"
}

provider "aws" {
  region = "us-east-2"
  alias  = "usa"
}

resource "aws_security_group" "sg_1" {
  name     = "prod_firewall"
  provider = aws.usa
}

resource "aws_security_group" "sg_2" {
  name     = "staging_firewall"
  provider = aws.mumbai
}