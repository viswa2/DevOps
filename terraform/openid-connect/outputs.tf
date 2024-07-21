output "oidc_role_arn" {
  description = "The ARN of the OIDC IAM role"
  value       = aws_iam_role.oidc_role.arn
}

output "dynamodb_item" {
  description = "The DynamoDB item for the OIDC role"
  value       = aws_dynamodb_table_item.oidc_role_entry.item
}

