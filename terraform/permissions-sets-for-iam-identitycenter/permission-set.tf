resource "aws_ssoadmin_permission_set" "example_permission_set" {
  instance_arn   = var.instance_arn
  name           = "ExamplePermissionSet"
  description    = "Permission set for example purposes"
  session_duration = "PT1H" # 1 hour session duration
}

#Attach one or more policies to the permission set
resource "aws_ssoadmin_managed_policy_attachment" "example_attachment" {
  instance_arn       = var.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.example_permission_set.arn
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

#Assign the permission set to groups for specific AWS accounts:
resource "aws_ssoadmin_account_assignment" "example_assignment" {
  instance_arn       = var.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.example_permission_set.arn
  principal_id       = var.group_id  # Replace with your group ID
  principal_type     = "GROUP"
  target_id          = var.aws_account_id  # Replace with your AWS account ID
  target_type        = "AWS_ACCOUNT"
}
