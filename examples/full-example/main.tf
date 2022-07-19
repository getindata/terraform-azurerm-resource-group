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

  consumption_budgets = {
    default = {
      amount = 100
      time_period = {
        start_date = "2022-07-01T00:00:00Z"
      }
      notifications = {
        actualEqualTo90 = {
          //other parameters are taken from defaults
          contact_emails = ["jakub.igla@getindata.com"]
        }
        forecastedGreaterThan100 = {
          contact_emails = ["jakub.igla@getindata.com"]
          operator       = "GreaterThan"
          threshold      = 100
          threshold_type = "Forecasted"
        }
      }
    }
  }
}
