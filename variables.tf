variable "api" {
  description = "id of an aws_api_gateway_rest_api resource"
}

variable "resource" {
  description = "id of an aws_api_gateway_resource resource"
}

variable "methods" {
  type        = list(string)
  description = "List of permitted HTTP methods. OPTIONS is added by default."
}

variable "origin" {
  description = "Permitted origin"
  default     = "*"
}

variable "headers" {
  description = "List of permitted headers. If overriding this, you must explicitly include any of the default headers that you still require."
  default     = ["Content-Type", "X-Amz-Date", "Authorization", "X-Api-Key", "X-Amz-Security-Token"]
}

locals {
  methodOptions  = "OPTIONS"
  defaultHeaders = ["Content-Type", "X-Amz-Date", "Authorization", "X-Api-Key", "X-Amz-Security-Token"]

  methods = join(",", distinct(concat(var.methods, [local.methodOptions])))
  headers = join(",", distinct(var.headers))
}

