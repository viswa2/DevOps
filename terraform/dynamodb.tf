resource "aws_dynamodb_table" "oidc_role_table" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "keyName"

  attribute {
    name = "keyName"
    type = "S"
  }

  tags = {
    Name = "OIDC Role Table"
  }
}

resource "aws_dynamodb_table_item" "oidc_role_entry" {
  table_name = aws_dynamodb_table.oidc_role_table.name
  hash_key   = "keyName"

  item = <<ITEM
{
  "keyName": { "S": "OIDC_IAM_ROLE" },
  "app": { "S": "root" },
  "keyValue": { "S": "${aws_iam_role.oidc_role.arn}" }
}
ITEM
}