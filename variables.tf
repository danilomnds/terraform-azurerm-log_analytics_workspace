variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "allow_resource_only_permissions" {
  type    = bool
  default = true
}

variable "local_authentication_disabled" {
  type    = bool
  default = false
}

variable "sku" {
  type    = string
  default = "PerGB2018"
}

variable "retention_in_days" {
  type    = number
  default = 30
}

variable "daily_quota_gb" {
  type    = number
  default = 1
}

variable "cmk_for_query_forced" {
  type    = bool
  default = false
}

variable "identity" {
  description = "Specifies the type of Managed Service Identity that should be configured on this Container Registry"
  type = object({
    type         = string
    identity_ids = optional(list(string))
  })
  default = null
}

variable "internet_ingestion_enabled" {
  type    = bool
  default = true
}

variable "internet_query_enabled" {
  type    = bool
  default = true
}

variable "reservation_capacity_in_gb_per_day" {
  type    = number
  default = null
}

variable "data_collection_rule_id" {
  type = string
  default = null  
}

variable "immediate_data_purge_on_30_days_enabled" {
  type = bool
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "azure_ad_groups" {
  type    = list(string)
  default = []
}