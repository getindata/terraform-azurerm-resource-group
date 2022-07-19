resource "azurerm_resource_group" "this" {
  count = module.this.enabled ? 1 : 0

  name     = local.name_from_descriptor
  location = var.location
  tags     = module.this.tags
}

resource "azurerm_consumption_budget_resource_group" "this" {
  for_each = module.this.enabled ? var.consumption_budgets : {}

  name              = each.key
  resource_group_id = local.id

  amount     = each.value["amount"]
  time_grain = lookup(each.value, "time_grain", local.consumption_budget_defaults.time_grain)

  time_period {
    start_date = each.value["time_period"]["start_date"]
    end_date   = lookup(each.value["time_period"], "end_date", null)
  }

  dynamic "notification" {
    for_each = each.value["notifications"]
    content {
      contact_emails = lookup(notification.value, "contact_emails", local.consumption_budget_defaults.notifications.contact_emails)
      operator       = lookup(notification.value, "operator", local.consumption_budget_defaults.notifications.operator)
      threshold      = lookup(notification.value, "threshold", local.consumption_budget_defaults.notifications.threshold)
      threshold_type = lookup(notification.value, "threshold_type", local.consumption_budget_defaults.notifications.threshold_type)
    }
  }
}
