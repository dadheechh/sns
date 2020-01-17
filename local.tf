locals {
  tags = {
    "tr:resource-owner"               = "${var.ResourceOwner}"
    "tr:application-asset-insight-id" = "${var.ApplicationAssetInsightId}"
    "tr:environment-type"             = "${var.EnvironmentType}"
    "tr:financial-identifier"         = "${var.FinancialIdentifier}"
  }

}