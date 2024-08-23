variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type        = string
  default = "Instance ARN of IAM identity center"
}

variable "permission_set_arn" {
  type = string
}

variable "managed_policies" {
  description = "List of managed policy ARNs to attach to the permission set"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/ReadOnlyAccess",
    "arn:aws:iam::aws:policy/PowerUserAccess" 
 ] 	 
}
