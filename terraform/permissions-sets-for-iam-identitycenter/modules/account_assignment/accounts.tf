resource "aws_ssoadmin_account_assignment" "account_assignments" {
  for_each = { for aa in var.account_assignments : "${aa.permission_set_name}-${aa.aws_account_id}" => aa }

  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arns[each.value.permission_set_name]
  principal_type     = "GROUP"
  target_id          = each.value.aws_account_id
  target_type        = "AWS_ACCOUNT"
  principal_id       = var.group_ids[each.value.group_names[0]] # Assuming one group per assignment
}