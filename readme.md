# Module - Log Analytics Workspace
[![COE](https://img.shields.io/badge/Created%20By-CCoE-blue)]()
[![HCL](https://img.shields.io/badge/language-HCL-blueviolet)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/provider-Azure-blue)](https://registry.terraform.io/providers/hashicorp/azurerm/latest)

Module developed to standardize the log analytics workspace creation.

## Compatibility Matrix

| Module Version | Terraform Version | AzureRM Version |
|----------------|-------------------| --------------- |
| v1.0.0         | v1.3.6            | 3.41.0          |

## Specifying a version

To avoid that your code get updates automatically, is mandatory to set the version using the `source` option. 
By defining the `?ref=***` in the the URL, you can define the version of the module.

Note: The `?ref=***` refers a tag on the git module repo.

## Use case
```hcl
module "<workspace name>" {
  source                         = "git::https://github.com/danilomnds/terraform-azurerm-log_analytics_workspace?ref=v1.0.0"
  name                           = "<workspace name>"
  location                       = "<region>"
  resource_group_name            = "<rg-name>"
  allow_resource_only_permissions = <true>
  local_authentication_disabled = <false>
  sku = "PerGB2018"
  retention_in_days = <30>
  daily_quota_gb = <1>
  tags = {
    "key1" = "value1"
    "key2" = "value2"    
  }
}
output "name" {
  value = module.<workspace name>.name
}
output "id" {
  value = module.<workspace name>.id
}
```

## Input variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | private endpoint name | `string` | n/a | `Yes` |
| resource_group_name | resource group where the private endpoint will be created | `string` | n/a | `Yes` |
| location | azure region | `string` | n/a | `Yes` |
| allow_resource_only_permissions | pecifies if the log Analytics Workspace allow users accessing to data associated with resources they have permission to view, without permission to workspace  | `bool` | `true` | No |
| local_authentication_disabled | Specifies if the log analytics workspace should enforce authentication using Azure AD  | `bool` | `false` | No |
| sku | Specifies the sku of the log analytics workspace | `string` | `PerGB2018` | No |
| retention_in_days | The workspace data retention in days | `number` | `30` | No |
| daily_quota_gb | The workspace daily quota for ingestion in GB | `number` | `1` | No |
| cmk_for_query_forced | Is customer managed storage mandatory for query management? | `bool` | `false` | No |
| internet_ingestion_enabled | Should the log analytics workspace support ingestion over the public internet? | `bool` | `true` | No |
| internet_query_enabled | Should the log analytics workspace support querying over the public internet?  | `bool` | `true` | No |
| reservation_capacity_in_gb_per_day | The capacity reservation level in GB for this workspace | `number` | `null` | No |
| tags | tags for the resource | `map(string)` | `{}` | No

  ## Output variables

| Name | Description |
|------|-------------|
| name | log analytics workspace name|
| id | log analytics workspace id |

## Documentation
Terraform Log Analytics Workspace: <br>
[https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace)