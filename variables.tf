variable "custom_domain" {
  type = object({
    fqdn            = string
    certificate_arn = string
  })
  description = "Custom domain to use for the API Gateway"
}

variable "api_gateway_name" {
  type        = string
  description = "Name of the API Gateway"
}

variable "api_gateway_id" {
  type        = string
  description = "ID of the API Gateway"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resources generated by this module"
  default     = {}
}

variable "stage_name" {
  type        = string
  description = "Name of the API Gateway stage"
  default     = "prod"
}

variable "redeployment_triggers" {
  type        = list(any)
  description = "List of values to trigger a redeployment of the API Gateway"
  default     = []
}

locals {
  tags = merge(var.tags, {
    "Name"   = var.api_gateway_name
    "Source" = "Terraform"
    "Module" = "rest-api-gateway-custom-domain-stage"
  })
  stage_name = var.stage_name
}
