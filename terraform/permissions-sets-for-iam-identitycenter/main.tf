provider "aws" {
  region = "us-east-1"
}

locals {
  #groups_json       = file("${path.module}/groups.json")
  groups = jsondecode(file(local.groups_json))
  #users_json        = file("${path.module}/users.json")
  users             = jsondecode(local.users_json)
  group_memberships = jsondecode(file("${path.module}/group_memberships.json"))
}

module "groups" {
  source   = "./modules/groups"
  groups   = local.groups
  store_id = var.store_id
}

module "users" {
  source   = "./modules/users"
  users    = local.users
  store_id = var.store_id
}

module "group_memberships" {
  source            = "./modules/group_memberships"
  store_id          = var.store_id
  group_memberships = local.group_memberships
  group_ids         = module.groups.group_ids
  user_ids          = module.users.user_ids
}

module "permission_sets" {
  source          = "./modules/permission_set"
  instance_arn    = var.instance_arn
  permission_sets = var.permission_sets
}

module "policy_attachments" {
  source              = "./modules/policy_attachment"
  instance_arn        = var.instance_arn
  policy_attachments  = var.policy_attachments
  permission_set_arns = module.permission_sets.permission_set_arns
}

module "account_assignments" {
  source              = "./modules/account_assignment"
  instance_arn        = var.instance_arn
  account_assignments = var.account_assignments
  permission_set_arns = module.permission_sets.permission_set_arns
  group_ids           = module.groups.group_ids
}

output "group_ids" {
  value = module.groups.group_ids
}

output "user_ids" {
  value = module.users.user_ids
}