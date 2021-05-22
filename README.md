# Security Center Terraform module

Azure Security Center is a unified infrastructure security management system that strengthens the security posture of your data centers and provides advanced threat protection across your hybrid workloads in the cloud. This module helps you to create Azure Security Center resources for Azure Landing Zones.

Security Center collects data from the Azure virtual machines (VMs), virtual machine scale sets, IaaS containers, and non-Azure (including on-premises) computers to monitor for security vulnerabilities and threats. Data is collected using the `Log Analytics agent`, which reads various security-related configurations and event logs from the machine and copies the data to the workspace for analysis.  Data collected by Security Center stored in __Log Analytics workspace(s)__.

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

## Security Center API Settings

This module support enable/disable Microsoft Cloud App Security data access (MCAS) and Windows Defender ATP data access (WDATP). Use `enable_security_center_setting` and `security_center_setting_name` to use this feature.

## Agents Auto Provisioning

Security Center collects data from your Azure virtual machines (VMs), virtual machine scale sets, IaaS containers, and non-Azure (including on-premises) machines to monitor for security vulnerabilities and threats.

Data collection is required to provide visibility into missing updates, misconfigured OS security settings, endpoint protection status, and health and threat protection. Data collection is only needed for compute resources such as VMs, virtual machine scale sets, IaaS containers, and non-Azure computers.

Auto provisioning reduces management overhead by installing all required agents and extensions on existing - and new - machines to ensure faster security coverage for all supported resources. To enable this feature with this module declare the `enable_security_center_auto_provisioning = "On"` variable.

## Requirements

Name | Version
-----|--------
terraform | >= 0.13
azurerm | >= 2.59.0

## Providers

| Name | Version |
|------|---------|
azurerm | >= 2.59.0

## Inputs

Name | Description | Type | Default
---- | ----------- | ---- | -------
`resource_group_name` | The name of the resource group in which resources are created | string | `""`
`log_analytics_workspace_name`|The name of log analytics workspace name|string|`""`
`security_center_contacts`|Manages the subscription's Security Center Contact|object|{}
`scope_resource_id`|The scope of VMs to send their security data to the desired workspace, unless overridden by a setting with more specific scope|string|`current Subscripion id`
`security_center_subscription_pricing`| The pricing tier to use. Possible values are `Free` and `Standard`|string|`Standard`
`resource_type`|The resource type this setting affects. Possible values are `AppServices`, `ContainerRegistry`, `KeyVaults`, `KubernetesService`, `SqlServers`, `SqlServerVirtualMachines`, `StorageAccounts`, `VirtualMachines`, `Arm` and `Dns`|string|`VirtualMachines`
`enable_security_center_setting`|Boolean flag to enable/disable data access|string|`false`
`security_center_setting_name`|The setting to manage. Possible values are `MCAS` and `WDAT`|string|`MCAS`
`enable_security_center_auto_provisioning`|Should the security agent be automatically provisioned on Virtual Machines in this subscription? Possible values are `On` (to install the security agent automatically, if it's missing) or `Off` (to not install the security agent automatically).|string|`"Off"`

## Outputs

Name | Description
---- | -----------
`security_center_workspace_id`|The Security Center Workspace resource ID
`security_center_subscription_pricing_id`|The subscription pricing resource ID
`security_center_contact_id`|The Security Center Contact resource ID

## Resource Graph

![Resource Graph](graph.png)

## Authors

Originally created by [Kumaraswamy Vithanala](mailto:kumarvna@gmail.com)

## Other resources

* [Azure Security Center](https://docs.microsoft.com/en-us/azure/security-center/security-center-introduction)
* [Terraform AzureRM Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
