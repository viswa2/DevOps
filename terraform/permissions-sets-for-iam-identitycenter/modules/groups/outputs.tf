output "group_ids" {
  value = { for name, group in aws_identitystore_group.groups : name => group.group_id }
}

