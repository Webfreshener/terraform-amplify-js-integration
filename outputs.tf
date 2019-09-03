output "aws_exports_file" {
  value = "${var.project_path}/src/aws-exports.js"
}

output "amplify_api_service" {
  value = "${var.project_path}/src/app/API.service.js"
}
