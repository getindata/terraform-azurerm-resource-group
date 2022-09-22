locals {
  name_from_descriptor = replace(lookup(module.this.descriptors, "resource-group", module.this.id), "/--+/", "-")

  consumption_budget_defaults = {
    time_grain = "Monthly"
    consumption_budget_start_date = (length(time_static.consumption_budget_start_date) == 0 ? null :
    format("%s-01T00:00:00Z", substr(one(time_static.consumption_budget_start_date[*].id), 0, 7)))
    notifications = {
      contact_emails = var.default_consumption_budget_notification_emails
      operator       = "EqualTo"
      threshold      = "90.0"
      threshold_type = "Actual"
    }
  }

  id       = one(azurerm_resource_group.this[*].id)
  name     = one(azurerm_resource_group.this[*].name)
  location = one(azurerm_resource_group.this[*].location)
}
