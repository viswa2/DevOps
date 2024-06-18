variable "aws_access_key_id" {
  description = "Value of the iam user access key id"
  type        = string
}

variable "aws_secret_access_key" {
  description = "Value of the iam user secret key id"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "thumbprint_list_id" {
  description = "SHA-1 thumbprint for GitHub OIDC provider"
  type        = string
  default     = "6938fd4d98bab03faadb97b34396831e3780aea1" # Default value, replace with your actual thumbprint
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "my-demo-test-bucket-prod" # Default value, replace with your actual thumbprint
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table"
  type        = string
}