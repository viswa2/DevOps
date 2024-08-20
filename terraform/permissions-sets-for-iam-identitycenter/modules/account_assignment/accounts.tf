resource "aws_ssoadmin_account_assignment" "example_assignment" {
  for_each           = var.group_ids
  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arn
  principal_id       = each.value
  principal_type     = "GROUP"
  target_id          = var.aws_account_id
  target_type        = "AWS_ACCOUNT"
}
