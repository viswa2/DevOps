resource "aws_identitystore_group" "groups" {
  for_each = var.groups

  identity_store_id = var.store_id
  display_name      = each.value.display_name
}

