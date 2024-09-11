provider "aws" {
  region = "us-west-2"
}

variable "elb-names" {
  type    = list(any)
  default = ["dev-loadbalancer", "test-loadbalancer", "stage-loadbalancer"]
}
resource "aws_iam_user" "lb" {
  name  = var.elb-names[count.index]
  count = 3
}
