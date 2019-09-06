variable "project_path" {

}

variable "appsync_region" {
  description = "Amplify AppSync Deployment Region"
}

variable "appsync_graphql_api_id" {
  description = "Amplify AppSync GraphQL ID"
  type = "string"
}

variable "identity_pool_region" {
  description = "Identity Pool Region"
  type = "string"
  default = null
}

variable "identiy_pool_id" {
  type = "string"
}

variable "user_pool_id" {
  type = "string"
}

variable "user_pool_client_id" {
  description = "Cognito User Pool Client ID"
  type = "string"
}

variable "s3_bucket" {
  description = "S3 Bucket Name"
  type = "string"
}

variable "graphql_endpoint" {
  description = "GraphQL Endpoint"
  type = "string"
}

variable "account_id" {
  description = "AWS Account ID"
  type = "string"
}

variable "API" {
  description = "AWS Account ID"
  type = "string"
  default = ""
}
