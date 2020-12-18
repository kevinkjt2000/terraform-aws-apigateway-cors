# Terraform API Gateway CORS module

This module intends to reduce boilerplate required when setting up CORS for API Gateway resources.

# Examples

An example module usage, which allows `GET` and `POST` methods from any origin (`*`), accepting default headers (Content-Type, X-Amz-Date, Authorization, X-Api-Key, X-Amz-Security-Token):

```
module "example_cors" {
  source  = "github.com/kevinkjt2000/terraform-aws-apigateway-cors"
  version = "3.0.0"

  api = aws_api_gateway_rest_api.example.id
  resource = aws_api_gateway_resource.example.id

  methods = ["GET", "POST"]
}
```

See variables.tf for other options, such as providing your own list of headers or a custom origin.
