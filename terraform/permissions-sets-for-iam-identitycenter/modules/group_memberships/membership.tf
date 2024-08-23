locals {
  group_membership_map = flatten([
    for group_name, users in var.group_memberships : [
      for user in users : {
        group_key = group_name
        user_key  = user
        group_id  = var.group_ids[group_name]
        user_id   = var.user_ids[user]
      }
    ]
  ])
}

resource "aws_identitystore_group_membership" "memberships" {
  for_each = { for item in local.group_membership_map : "${item.group_key}-${item.user_key}" => item }

  identity_store_id = var.store_id
  group_id          = each.value.group_id
  member_id         = each.value.user_id
}



