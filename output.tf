output "security_center_workspace_id" {
  description = "The Security Center Workspace resource ID."
  value       = azurerm_security_center_workspace.main.id
}

output "security_center_subscription_pricing_id" {
  value = azurerm_security_center_subscription_pricing.main.id
}
