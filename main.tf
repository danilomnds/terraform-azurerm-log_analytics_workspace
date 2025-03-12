resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                               = var.name
  resource_group_name                = var.resource_group_name
  location                           = var.location
  allow_resource_only_permissions    = var.allow_resource_only_permissions
  local_authentication_disabled      = var.local_authentication_disabled
  sku                                = var.sku
  retention_in_days                  = var.retention_in_days
  daily_quota_gb                     = var.daily_quota_gb
  cmk_for_query_forced               = var.cmk_for_query_forced
    dynamic "identity" {
    for_each = var.identity != null ? [var.identity] : []
    content {
      type         = identity.value.type
      identity_ids = lookup(identity.value, "identity_ids", null)
    }
  }
  internet_ingestion_enabled         = var.internet_ingestion_enabled
  internet_query_enabled             = var.internet_query_enabled
  reservation_capacity_in_gb_per_day = var.reservation_capacity_in_gb_per_day
  data_collection_rule_id = var.data_collection_rule_id
  immediate_data_purge_on_30_days_enabled = var.immediate_data_purge_on_30_days_enabled
  tags                               = local.tags
  lifecycle {
    ignore_changes = [
      tags["create_date"]
    ]
  }
}

resource "azurerm_role_assignment" "log_analytics_reader" {
  depends_on = [azurerm_log_analytics_workspace.log_analytics_workspace]
  for_each = {
    for k, v in toset(var.azure_ad_groups) : k => v    
  }
  scope                = azurerm_log_analytics_workspace.log_analytics_workspace.id
  role_definition_name = "Log Analytics Reader"
  principal_id         = each.value
}