provider "aws" {}

resource "aws_iam_user" "example" {
    name = "iamuser.${count.index}"
    count = 3
    path = "/system/"
}

output "iam_names" {
    value = aws_iam_user.example[*].name
}

output "iam_arn" {
    value = aws_iam_user.example[*].arn
}