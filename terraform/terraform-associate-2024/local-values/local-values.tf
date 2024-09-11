provider "aws" {
  region = "us-east-1"
}

variable "tags" {
  type = map(any)
  default = {
    Team = "security-team"
  }
}

locals {
  default = {
    Team         = "security-teams"
    CreationDate = "date-${formatdate("DD/MM/YYYY", timestamp())}"
  }
}

resource "aws_security_group" "sg_01" {
  name = "app_firewall"
  tags = local.default
}

resource "aws_security_group" "sg_02" {
  name = "db_firewall"
  tags = local.default
}