#####################################################################
# Challange:
# We need to fetch all existing IAM users present in the AWS account.
# List out the No. of users are presnt in the AWS account.
# List out the User names present in the AWS account.
######################################################################

provider "aws" {
  region = "us-east-2"
}

#Fetch the IAM users present in the AWS account

data "aws_iam_users" "all_users" {
}

# Use this data source to get the access to the effective Account ID
data "aws_caller_identity" "current" {}

resource "aws_iam_user" "user" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
  path = "/"

}

# Output the IAM user details 
output "iam_users" {
  value = data.aws_iam_users.all_users.names
}

# Output the IAM User details with the length function
output "total_users" {
  value = length(data.aws_iam_users.all_users.names)
}
