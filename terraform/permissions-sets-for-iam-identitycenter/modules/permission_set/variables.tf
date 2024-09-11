variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type        = string
}

variable "permission_sets" {
  description = "List of permission sets"
  type = list(object({
    name             = string
    description      = string
    session_duration = string
  }))
}
