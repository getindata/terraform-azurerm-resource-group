resource "azurerm_resource_group" "this_resource_group" {
  count = module.this.enabled ? 1 : 0

  name     = local.name_from_descriptor
  location = var.location
  tags     = module.this.tags
}
