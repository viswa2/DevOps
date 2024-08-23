output "user_ids" {
  value = {
    for user_name, user in aws_identitystore_user.users :
    user_name => user.user_id
  }
}

