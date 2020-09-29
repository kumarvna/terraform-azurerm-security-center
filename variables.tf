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

variable "security_center_contacts" {
  description = "Manages the subscription's Security Center Contact"
  default     = {}
}

variable "scope_resource_id" {
  description = "The scope of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope"
  default     = null
}
