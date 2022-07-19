consumption_budgets = {
  default = {
    amount = 100
    time_period = {
      start_date = "2022-07-01T00:00:00Z"
    }
    notifications = {
      forecastedGreaterThan100 = {
        contact_emails = ["notify@example.com"]
        operator       = "GreaterThan"
        threshold      = 100
        threshold_type = "Forecasted"
      }
    }
  }
}