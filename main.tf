# null_data_source._
data "null_data_source" "_" {
  inputs = {
    exports_file_path = "${var.project_path}/src/aws-exports.js"
    rm_codegen = fileexists("${var.project_path}/src/app/API.service.js") ? "amplify remove codegen ;" : ""
  }
}

# null_resource.write_ng_amplify_config
resource "null_resource" "write_ng_amplify_config" {
  triggers = {
    value = templatefile("${path.module}/aws-exports.template.js", {
      uuid = uuid()
      region = var.appsync_region
      identity_pool_id = var.identiy_pool_id
      identity_pool_region = var.identity_pool_region != null ? var.identity_pool_region : var.appsync_region
      user_pool_id = var.user_pool_id
      client_id = var.user_pool_client_id
      upload_bucket = var.s3_bucket
      graphql_endpoint = var.graphql_endpoint
      account_id = var.account_id
    })
  }
  depends_on = [
  ]
  provisioner "local-exec" {
    command = "rm ${data.null_data_source._.outputs.exports_file_path} ; echo \"${null_resource.write_ng_amplify_config.triggers.value}\" >> ${data.null_data_source._.outputs.exports_file_path}"
  }
}

# null_resource.run_codegen
resource "null_resource" "run_codegen" {
  depends_on = [
    "null_resource.write_ng_amplify_config"
  ]
  triggers = {
    value = uuid()
  }
  provisioner "local-exec" {
    command = "cd ${var.project_path} ; ${data.null_data_source._.outputs.rm_codegen} echo \"Y Y Y Y Y Y\" | amplify add codegen --apiId ${var.appsync_graphql_api_id} ; cd ${path.module}"
  }
}
