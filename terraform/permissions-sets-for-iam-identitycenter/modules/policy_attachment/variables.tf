variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type        = string
}

variable "policy_attachments" {
  description = "List of policy attachments"
  type = list(object({
    permission_set_name = string
    managed_policies    = list(string)
    custom_policies     = list(string)
  }))
}

variable "permission_set_arns" {
  description = "Map of permission set names to their ARNs"
  type        = map(string)
}
