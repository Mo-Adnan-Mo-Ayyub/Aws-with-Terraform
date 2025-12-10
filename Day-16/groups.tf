resource "aws_iam_group" "education" {
  name = "Education"
  path = "/groups/"
}

resource "aws_iam_group" "engineers" {
  name = "Engineers"
  path = "/groups/"
}

resource "aws_iam_group" "managers" {
  name = "Managers"
  path = "/groups/"
}

resource "aws_iam_group" "testers" {
  name = "Testers"
  path = "/groups/"
}

resource "aws_iam_group" "sales" {
  name = "Testers"
  path = "/groups/"
}


resource "aws_iam_group_membership" "education_mambers" {
  name  = "aducation_group_membership"
  group = aws_iam_group.education.name

  users = [for user in aws_iam_user.users : user.name if user.tags.Department == "Education"]
}

resource "aws_iam_group_membership" "engineers_members" {
  name  = "engineers-group-membership"
  group = aws_iam_group.engineers.name

  users = [for user in aws_iam_user.users : user.name if user.tags.Department == "Engineering"]
}

resource "aws_iam_group_membership" "managers_members" {
  name  = "managers-group-membership"
  group = aws_iam_group.managers.name

  users = [for user in aws_iam_user.users : user.name if contains(keys(user.tags), "JobTitle") && can(regex("Manager|CEO", user.tags.JobTitle))]
}

resource "aws_iam_group_membership" "testers_members" {
  name  = "testers-group-membership"
  group = aws_iam_group.testers.name

  users = [for user in aws_iam_user.users : user.name if user.tags.Department == "Quality Assurance"]
}

resource "aws_iam_group_membership" "sales_members" {
  name  = "sales-group-membership"
  group = aws_iam_group.sales.name

  users = [for user in aws_iam_user.users : user.name if user.tags.Department == "Sales"]
}


resource "aws_iam_group_policy_attachment" "education_readonly" {
  group      = aws_iam_group.education.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "engineers_poweruser" {
  group      = aws_iam_group.engineers.name
  policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}

resource "aws_iam_group_policy_attachment" "managers_iam_readonly" {
  group      = aws_iam_group.managers.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "managers_billing_readonly" {
  group      = aws_iam_group.managers.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "testers_readonly" {
  group      = aws_iam_group.testers.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_group_policy_attachment" "sales_billing_readonly" {
  group      = aws_iam_group.sales.name
  policy_arn = "arn:aws:iam::aws:policy/AWSBillingReadOnlyAccess"
}