module "resource_group" {
  source  = "../../"
  context = module.this.context

  name     = "network"
  location = "West Europe"
}
