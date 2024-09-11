locals {
  policy_set = flatten([
    for pa in var.policy_attachments : [
      for policy in pa.managed_policies : {
        permission_set_name = pa.permission_set_name
        policy_arn          = policy
      }
    ]
  ])
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_policy_attachments" {
  for_each = {
    for policy in local.policy_set : "${policy.permission_set_name}-${policy.policy_arn}" => policy
  }

  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arns[each.value.permission_set_name]
  managed_policy_arn = each.value.policy_arn

  timeouts {
    create = "30m"
    delete = "30m"
  }

  lifecycle {
    ignore_changes = [permission_set_arn]
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "custom_policy_attachments" {
  for_each = { for pa in var.policy_attachments : pa.permission_set_name => pa if length(pa.custom_policies) > 0 }

  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arns[each.key]
  inline_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      for policy in each.value.custom_policies : {
        Effect   = "Allow"
        Action   = "*"
        Resource = policy
      }
    ]
  })
}