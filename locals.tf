locals {
  name_from_descriptor = replace(lookup(module.this.descriptors, "resource-group", module.this.id), "/--+/", "-")

  id       = one(azurerm_resource_group.this_resource_group[*].id)
  name     = one(azurerm_resource_group.this_resource_group[*].name)
  location = one(azurerm_resource_group.this_resource_group[*].location)
}
