resource "aws_iam_policy" "require_mfa" {
  name        = "RequireMFAPolicy"
  description = "Require multi-factor authentication (MFA) for IAM users"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyAllExceptListedIfNoMFA"
        Effect = "Deny"
        NotAction = [
          "iam:CreateVirtualMFADevice",
          "iam:EnableMFADevice",
          "iam:ListMFADevices",
          "iam:ListVirtualMFADevices",
          "iam:GetUser",
          "sts:GetSessionToken"
        ]
        Resource = "*"
        Condition = {
          BoolIfExists = {
            "aws:MultiFactorAuthPresent" = "false"
          }
        }
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "attach_mfa_policy" {
  for_each = aws_iam_user.users

  user       = each.value.name
  policy_arn = aws_iam_policy.require_mfa.arn
}