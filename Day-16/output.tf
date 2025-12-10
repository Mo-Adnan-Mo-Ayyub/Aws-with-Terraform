output "account_name" {
  value = data.aws_caller_identity.account_name
}

output "user_name" {
  value = [for user in local.local.users : "${user.first_name} ${user.last_name}"]
}