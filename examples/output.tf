output "security_center_workspace_id" {
  description = "The Security Center Workspace resource ID."
  value       = module.security-center.security_center_workspace_id
}

output "security_center_subscription_pricing_id" {
  description = "The subscription pricing ID"
  value       = module.security-center.security_center_subscription_pricing_id
}

output "security_center_contact_id" {
  description = "The Security Center Contact ID"
  value       = module.security-center.security_center_contact_id
}
