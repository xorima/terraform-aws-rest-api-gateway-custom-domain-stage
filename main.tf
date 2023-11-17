
resource "aws_api_gateway_domain_name" "custom_domain" {
  domain_name              = var.custom_domain.fqdn
  regional_certificate_arn = var.custom_domain.certificate_arn
  endpoint_configuration {
    types = ["REGIONAL"]
  }
  tags = local.tags
}

resource "aws_api_gateway_base_path_mapping" "mapping" {
  api_id      = var.api_gateway_id
  stage_name  = aws_api_gateway_deployment.deployment.stage_name
  domain_name = aws_api_gateway_domain_name.custom_domain.domain_name
}

resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id       = var.api_gateway_id
  stage_name        = local.stage_name
  stage_description = "${local.stage_name} stage for ${var.api_gateway_name}"
  lifecycle {
    create_before_destroy = true
  }
  triggers = {
    redeployment = sha1(jsonencode(var.redeployment_triggers))
  }
}