variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "log_analytics_workspace_name" {
  description = "The name of log analytics workspace name"
  default     = ""
}

variable "security_center_subscription_pricing" {
  description = "The pricing tier to use. Possible values are Free and Standard"
  default     = "Standard"
}

variable "resource_type" {
  description = "The resource type this setting affects"
  default     = "VirtualMachines"
}

variable "security_center_contacts" {
  type        = map(string)
  description = "Manages the subscription's Security Center Contact"
  default     = {}
}

variable "scope_resource_id" {
  description = "The scope of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope"
  default     = null
}

variable "security_center_setting_name" {
  description = "The setting to manage. Possible values are `MCAS` and `WDAT`"
  default     = "MCAS"
}

variable "enable_security_center_setting" {
  description = "Boolean flag to enable/disable data access"
  default     = false
}

variable "enable_security_center_auto_provisioning" {
  description = "Should the security agent be automatically provisioned on Virtual Machines in this subscription?"
  default     = "Off"
}
