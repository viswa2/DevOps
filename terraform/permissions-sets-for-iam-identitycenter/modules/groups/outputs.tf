output "group_ids" {
  value = {
    for group_name, group in aws_identitystore_group.groups :
    group_name => group.group_id
  }
}

