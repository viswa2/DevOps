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
