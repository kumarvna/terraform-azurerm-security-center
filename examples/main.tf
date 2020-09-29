module "security-center" {
  // source  = "kumarvna/security-center/azurerm"
  // version = "1.0.0"
  source = "../"

  log_analytics_workspace_name = "loganalytics-we-sharedtest"


}
