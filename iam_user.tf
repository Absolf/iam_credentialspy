provider "aws" {
  shared_credentials_file = "./credentials"
  profile = "default"
  region     = "us-east-2"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
}

locals {
  pgp_key = "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"
}



resource "aws_iam_user" "test_user"{
  name = var.name_iam_user
}

resource "aws_iam_access_key" "test_user" {
  user = "${aws_iam_user.test_user.name}"
  pgp_key = "${local.pgp_key}"
}

resource "aws_iam_user_login_profile" "test_user" {
  user    = "${aws_iam_user.test_user.name}"
  pgp_key = "${local.pgp_key}"
}

# shell version
#data "external" "aws_user_cred" {
#  program = ["bash", "${path.module}/aws-cred.sh", "${aws_iam_access_key.test_user.id}", "${aws_iam_access_key.test_user.encrypted_secret}","${aws_iam_user.test_user.name}", "${aws_iam_user_login_profile.test_user.encrypted_password}"]
#  depends_on = ["aws_iam_user_login_profile.test_user"]
#}

# python version
data "external" "aws_user_cred" {
  program = ["python3", "${path.module}/aws-cred.py", "${aws_iam_access_key.test_user.id}", "${aws_iam_access_key.test_user.encrypted_secret}","${aws_iam_user.test_user.name}", "${aws_iam_user_login_profile.test_user.encrypted_password}"]
  depends_on = ["aws_iam_user_login_profile.test_user"]
}
