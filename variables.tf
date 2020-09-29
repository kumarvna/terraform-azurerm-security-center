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
