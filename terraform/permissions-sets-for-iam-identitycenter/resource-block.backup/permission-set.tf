# Creating the identity store users
resource "aws_identitystore_user" "users" {
  for_each = var.users

  identity_store_id = var.store_id
  display_name      = each.value.display_name
  user_name         = each.key

  name {
    given_name  = each.value.given_name
    family_name = each.value.family_name
  }

  emails {
    value = each.value.email
  }
}

# Creating identity store groups
resource "aws_identitystore_group" "groups" {
  for_each = var.groups

  identity_store_id = var.store_id
  display_name      = each.value.display_name
}

# Adding users to group membership
locals {
  group_membership_list = [
    for group_name, users in var.group_memberships : [
      for user in users : {
        group_key = group_name
        user_key  = user
        group_id  = aws_identitystore_group.groups[group_name].group_id
        user_id   = aws_identitystore_user.users[user].user_id
      }
    ]
  ]
}

resource "aws_identitystore_group_membership" "memberships" {
  for_each = { for idx, item in flatten(local.group_membership_list) : "${item.group_key}-${item.user_key}" => item }

  identity_store_id = var.store_id
  group_id          = each.value.group_id
  member_id         = each.value.user_id
}

# Creating permission set
resource "aws_ssoadmin_permission_set" "example_permission_set" {
  instance_arn     = var.instance_arn
  name             = "ExamplePermissionSet"
  description      = "Permission set for example purposes"
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
  for_each           = aws_identitystore_group.groups
  instance_arn       = var.instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.example_permission_set.arn
  principal_id       = each.value.group_id
  principal_type     = "GROUP"
  target_id          = var.aws_account_id # Replace with your AWS account ID
  target_type        = "AWS_ACCOUNT"
}
