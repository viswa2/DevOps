locals {
  flattened_memberships = flatten([
    for group_key, users in var.group_memberships : [
      for user in users : {
        group_key = group_key
        user_key  = user
      }
    ]
  ])
}

resource "aws_identitystore_group_membership" "memberships" {
  for_each = {
    for membership in local.flattened_memberships : "${membership.group_key}-${membership.user_key}" => membership
  }

  identity_store_id = var.store_id
  group_id          = var.group_ids[each.value.group_key]
  member_id         = var.user_ids[each.value.user_key]
}