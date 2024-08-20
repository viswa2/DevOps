resource "aws_ssoadmin_permission_set" "example_permissionset" {
  instance_arn     = var.instance_arn
  name             = var.name
  description      = var.description
  session_duration = var.session_duration
}
