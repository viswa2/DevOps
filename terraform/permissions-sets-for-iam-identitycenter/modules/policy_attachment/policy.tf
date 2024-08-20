resource "aws_ssoadmin_managed_policy_attachment" "example_attachment" {
  for_each           = toset(var.managed_policies)
  instance_arn       = var.instance_arn
  permission_set_arn = var.permission_set_arn
  managed_policy_arn = each.value
}

