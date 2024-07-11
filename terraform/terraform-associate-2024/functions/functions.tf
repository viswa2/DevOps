provider "aws" {
    region = "us-west-2"
}

resource "aws_iam_user" "this" {
  name = "demo-user"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "demo-user-policy"
  user = aws_iam_user.this.name

  policy = file("./iam-user-policy.json")
    
}