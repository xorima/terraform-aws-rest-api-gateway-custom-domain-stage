output "stage_name" {
  value       = aws_api_gateway_base_path_mapping.mapping.stage_name
  description = "The name of the stage created"
}

output "custom_domain_name" {
  value       = aws_api_gateway_domain_name.custom_domain.domain_name
  description = "The custom FQDN to create in DNS"
}

output "custom_domain_name_address" {
  value       = aws_api_gateway_domain_name.custom_domain.regional_domain_name
  description = "The value for the CNAME record to create"
}

output "custom_domain_name_arn" {
  value       = aws_api_gateway_domain_name.custom_domain.regional_certificate_arn
  description = "The ARN for the custom domain name"
}
