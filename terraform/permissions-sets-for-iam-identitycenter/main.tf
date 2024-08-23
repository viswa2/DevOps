provider "aws" {
  region = "us-east-1"
}
module "users" {
  source   = "./modules/users"
  store_id = var.store_id
  users    = var.users
}

module "groups" {
  source   = "./modules/groups"
  store_id = var.store_id
  groups   = var.groups
}

module "group_memberships" {
  source            = "./modules/group_memberships"
  store_id          = var.store_id
  group_memberships = var.group_memberships
  group_ids         = module.groups.group_ids
  user_ids          = module.users.user_ids
}

module "permission_set" {
  source           = "./modules/permission_set"
  instance_arn     = var.instance_arn
  name             = var.name
  description      = "Permission set for example purposes"
  session_duration = "PT1H"
}

module "policy_attachment" {
  source             = "./modules/policy_attachment"
  instance_arn       = var.instance_arn
  permission_set_arn = module.permission_set.permission_set_arn
  managed_policies   = var.managed_policies
}

module "account_assignment" {
  source             = "./modules/account_assignment"
  instance_arn       = var.instance_arn
  permission_set_arn = module.permission_set.permission_set_arn
  group_ids          = module.groups.group_ids
  aws_account_id     = var.aws_account_id
}
