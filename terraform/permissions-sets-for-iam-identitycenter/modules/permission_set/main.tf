resource "aws_ssoadmin_permission_set" "permission_sets" {
  for_each = { for ps in var.permission_sets : ps.name => ps }

  instance_arn     = var.instance_arn
  name             = each.value.name
  description      = each.value.description
  session_duration = each.value.session_duration
}

