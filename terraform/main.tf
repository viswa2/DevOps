# Following configuration to set up the OIDC provider
resource "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"

  client_id_list = ["sts.amazonaws.com"]

  thumbprint_list = [var.thumbprint_list_id]
}

# Create a Oidc role for IAM in the trust relationship with the trusted entities that allows to assume it.
resource "aws_iam_role" "oidc_role" {
  name = "OIDC_IAM_ROLE"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = aws_iam_openid_connect_provider.github.arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:viswa2/*:ref:refs/heads/master"
          }
        }
      }
    ]
  })
}

# Attach policies to the IAM role to grant the necessary permissions. Ex: if you need S3 access
resource "aws_iam_role_policy" "oidc_actions_policy" {
  name = "OidcActionsPolicy"
  role = aws_iam_role.oidc_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "s3:*"
        Resource = [
          "arn:aws:s3:::${var.s3_bucket_name}",
          "arn:aws:s3:::${var.s3_bucket_name}/*"
        ]
      }
    ]
  })
}