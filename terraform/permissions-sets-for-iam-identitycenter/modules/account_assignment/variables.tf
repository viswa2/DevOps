variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type        = string
  default     = "Instance ARN of IAM identity center"
}

variable "permission_set_arn" {
  type = string
}

variable "group_ids" {
  type = map(string)
}

variable "aws_account_id" {
  description = "The ID of the AWS account"
  type        = string
  default     = "AWS account id" # account id of AWS
}
