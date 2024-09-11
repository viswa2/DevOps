variable "store_id" {
  type    = string
  default = "IDENTITY_STORE_ID"
}

variable "instance_arn" {
  type    = string
  default = "INSTANCE_ARN_FOR_IAM_IDENTITY_CENTER"
}

variable "aws_account_id" {
  type    = string
  default = "AWS_ACCOUNT_ID"
}

variable "permission_sets" {
  description = "List of permission sets"
  type = list(object({
    name             = string
    description      = string
    session_duration = string
  }))
  default = [
    {
      name             = "Example-PermissionSet"
      description      = "Permission set for example purposes"
      session_duration = "PT1H"
    }
  ]
}

variable "policy_attachments" {
  description = "List of policy attachments"
  type = list(object({
    permission_set_name = string
    managed_policies    = list(string)
    custom_policies     = list(string)
  }))
  default = [
    {
      permission_set_name = "Example-PermissionSet"
      managed_policies    = ["arn:aws:iam::aws:policy/ReadOnlyAccess", "arn:aws:iam::aws:policy/PowerUserAccess"]
      custom_policies     = ["arn:aws:iam::123456789012:policy/CustomPolicy1", "arn:aws:iam::123456789012:policy/CustomPolicy2"]
    }
  ]
}

variable "account_assignments" {
  description = "List of account assignments"
  type = list(object({
    permission_set_name = string
    group_names         = list(string)
    aws_account_id      = string
  }))
  default = [
    {
      permission_set_name = "Example-PermissionSet"
      group_names         = ["admin_group", "dev_group", "test_group"]
      aws_account_id      = "AWS_ACCOUNT_ID"
    }
  ]
}
