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

variable "tags" {
  type    = map(string)
  default = {}
}