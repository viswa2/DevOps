variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type        = string
  default     = "Instance ARN of IAM identity center"
}

variable "account_assignments" {
  description = "List of account assignments"
  type = list(object({
    permission_set_name = string
    group_names         = list(string)
    aws_account_id      = string
  }))
}

variable "permission_set_arns" {
  description = "The ARN of the permission set"
  type        = map(string)
}

variable "group_ids" {
  type = map(string)
}

variable "aws_account_id" {
  description = "The ID of the AWS account"
  type        = string
  default     = "aws account id details" # account ids of AWS
}
