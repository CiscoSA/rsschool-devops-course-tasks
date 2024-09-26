resource "aws_iam_role" "role_for_github" {
  assume_role_policy = data.aws_iam_policy_document.github_actions_role_policy.json
}

# terraform import aws_iam_role.role_for_github GithubActionsRole


data "aws_iam_policy_document" "github_actions_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.github_actions_IODC_provider.arn]
    }
    condition {
      test     = "StringEquals"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }
    condition {
      test     = "StringLike"
      variable = "token.actions.githubusercontent.com:sub"
      # values   = ["repo:CiscoSA/rsschool-devops-course-tasks:*"]
      values   = ["repo:${var.repo}"]
      # values   = ["repo:CiscoSA/rsschool-devops-course-tasks:ref:refs/heads/dev*"] # Uncomment it to make condition more strict
    }
  }
}

# GitHub Actions OIDC Provider
resource "aws_iam_openid_connect_provider" "github_actions_IODC_provider" {
  client_id_list = ["sts.amazonaws.com"]
  url = "https://token.actions.githubusercontent.com"
  thumbprint_list = ["d89e3bd43d5d909b47a18977aa9d5ce36cee184c"]
}