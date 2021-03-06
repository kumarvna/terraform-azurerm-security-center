# Security Center Terraform module

Terraform module to create Azure Security Center resources for Azure Landing Zones.

## Module Usage

```hcl
module "security-center" {
  source  = "kumarvna/security-center/azurerm"
  version = "1.1.0"


  # Resource Group, location, log analytics details
  resource_group_name          = "rg-shared-westeurope-01"
  log_analytics_workspace_name = "loganalytics-we-sharedtest2"

  # Enable Security Center API Setting
  enable_security_center_setting = true
  security_center_setting_name   = "MCAS"

  # Enable auto provision of log analytics agents on VM's if they doesn't exist. 
  enable_security_center_auto_provisioning = "On"

  # Subscription Security Center contacts
  # One or more email addresses seperated by commas not supported by Azure proivider currently
  security_center_contacts = {
    email               = "abc@xyz.com"   # must be a valid email address
    phone               = "+919010910910" # Optional
    alert_notifications = true
    alerts_to_admins    = true
  }
}
```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply

```

Run `terraform destroy` when you don't need these resources.

## Outputs

Name | Description
---- | -----------
`security_center_workspace_id`|The Security Center Workspace resource ID
`security_center_subscription_pricing_id`|The subscription pricing resource ID
`security_center_contact_id`|The Security Center Contact resource ID
