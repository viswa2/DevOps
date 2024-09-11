output "user_ids" {
  value = { for name, user in aws_identitystore_user.users : name => user.user_id }
}
