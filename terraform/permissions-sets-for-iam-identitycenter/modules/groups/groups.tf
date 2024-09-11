resource "aws_identitystore_group" "groups" {
  for_each = { for group in var.groups : group.display_name => group }

  display_name      = each.value.display_name
  description       = lookup(each.value, "description", null)
  identity_store_id = var.store_id
}