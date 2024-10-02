locals {
  resource_suffix                = [lower(var.environment), lower(var.region), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase      = join("-", local.resource_suffix)
  resource_suffix_spk3           = [lower(var.environment), lower(var.region_spk3), lower(var.domain), lower(var.workload), random_id.resource_group_name_suffix.hex]
  resource_suffix_kebabcase_spk3 = join("-", local.resource_suffix_spk3)

  resource_group_name = coalesce(
    try(data.azurerm_resource_group.this[0].name, null),
    try(azurerm_resource_group.this[0].name, null)
  )
  resource_group_location = coalesce(
    try(data.azurerm_resource_group.this[0].location, null),
    try(azurerm_resource_group.this[0].location, null)
  )
  
  tags = merge(
    var.tags,
    tomap(
      {
        "Environment" = var.environment,
        "ProjectName" = "hub-spoke/vnet-gw-scenario",
        "Domain"      = var.domain
      }
    )
  )
}