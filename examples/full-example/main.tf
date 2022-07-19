module "this_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = module.this.context

  descriptor_formats = {
    resource-group = {
      labels = ["name"]
      format = "%v-rg"
    }
  }
}

module "resource_group" {
  source  = "../../"
  context = module.this_label.context

  name     = "network"
  location = "West Europe"

  consumption_budgets = var.consumption_budgets
}
