#----------------------------------------------------------
# Resource Group, Log Analytics Data Resources
#----------------------------------------------------------
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "logws" {
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

#----------------------------------------------------------
# Current Subscription Data Resources
#----------------------------------------------------------

data "azurerm_subscription" "current" {}

#----------------------------------------------------------
# Azure Security Center Workspace Resource
#----------------------------------------------------------

resource "azurerm_security_center_workspace" "main" {
  scope        = var.scope_resource_id == null ? data.azurerm_subscription.current.id : var.scope_resource_id
  workspace_id = data.azurerm_log_analytics_workspace.logws.id
}

#----------------------------------------------------------
# Azure Security Center Subscription Pricing Resources
#----------------------------------------------------------

resource "azurerm_security_center_subscription_pricing" "main" {
  tier = var.security_center_subscription_pricing
}

#----------------------------------------------------------
# Azure Security Center Contact Resources
#----------------------------------------------------------
resource "azurerm_security_center_contact" "main" {
  for_each            = var.security_center_contacts
  email               = lookup(var.security_center_contacts, "email")
  phone               = lookup(var.security_center_contacts, "phone")
  alert_notifications = lookup(var.security_center_contacts, "alert_notifications", true)
  alerts_to_admins    = lookup(var.security_center_contacts, "alerts_to_admins", true)
}

