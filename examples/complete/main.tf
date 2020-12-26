module "security-center" {
  source  = "kumarvna/security-center/azurerm"
  version = "1.0.0"

  # Resource Group, location, log analytics details
  resource_group_name          = "rg-shared-westeurope-01"
  log_analytics_workspace_name = "loganalytics-we-sharedtest"

  # Subscription Security Center contacts
  # One or more email addresses seperated by commas not supported by Azure proivider currently
  security_center_contacts = {
    email               = "abc@xyz.com"   # must be a valid email address
    phone               = "+919765800967" # Optional
    alert_notifications = true
    alerts_to_admins    = true
  }
}
