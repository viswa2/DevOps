variable "instance_arn" {
  description = "The ARN of the AWS SSO instance"
  type = string
  default = "Instance ARN of IAM identity center" # IAM identity center instance arn
}

variable "name" {
  description = "The name of the permission set"
  type        = string
  default     = "ExamplePermissionSet" # we can change the name in our cases
}

variable "session_duration" {
  description = "The duration for which the permissions are valid"
  type    = string
  default = "PT1H" # Default to 1 hour
}

variable "description" {
  type = string
  default = "This is all about permission set description"
}
