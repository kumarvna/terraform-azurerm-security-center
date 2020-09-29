#----------------------------------------------------------
# Resource Group, VNet, Subnet selection & Random Resources
#----------------------------------------------------------
data "azurerm_log_analytics_workspace" "logws" {
  count               = var.log_analytics_workspace_name != null ? 1 : 0
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subscription" "current" {}

resource "azurerm_security_center_workspace" "main" {
  scope        = var.scope_resource_id == null ? data.azurerm_subscription.id : var.scope_resource_id
  workspace_id = data.azurerm_log_analytics_workspace.logws.0.id
}

resource "azurerm_security_center_subscription_pricing" "main" {
  tier = var.security_center_subscription_pricing
}

resource "azurerm_security_center_contact" "main" {
  for_each = var.security_center_contacts
  content {
    email               = lookup(var.security_center_contacts, "email")
    phone               = lookup(var.security_center_contacts, "phone")
    alert_notifications = lookup(var.security_center_contacts, "email", true)
    alerts_to_admins    = lookup(var.security_center_contacts, "email", true)
  }
}

