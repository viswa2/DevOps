output "permission_set_arns" {
  value = { for ps in aws_ssoadmin_permission_set.permission_sets : ps.name => ps.arn }
}