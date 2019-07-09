output "id_key" {
  value = "${data.external.aws_user_cred.result.id_key}"
}
output "secret_key" {
  value = "${data.external.aws_user_cred.result.secret_key}"
}
output "username" {
  value = "${data.external.aws_user_cred.result.username}"
}
output "password" {
  value = "${data.external.aws_user_cred.result.password}"
}

