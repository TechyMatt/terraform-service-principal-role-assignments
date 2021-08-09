variable "sp_name" {}
variable "role_assignments" {}

locals {

    role_assignments = flatten([
    for role, scopes in var.role_assignments : [
      for scope in scopes : {
        role  = role
        scope = scope
      }
    ]
  ])

}

resource "azuread_application" "local" {
  display_name = var.sp_name

  create_duration = "60s"
  destroy_duration = "60s"
}

resource "azuread_service_principal" "local" {
  application_id = azuread_application.local.application_id
}

resource "azuread_service_principal_password" "local" {
  service_principal_id = azuread_service_principal.local.object_id
}

output "azuread_application_id" {
    value = azuread_application.local.application_id
}

output "azuread_service_principal_password" {
    value = azuread_service_principal_password.local.value
}

resource "azurerm_role_assignment" "local" {
  for_each = {
      for x in local.role_assignments: "${x.role}-${x.scope}" => x
  }

  scope                = each.value.scope
  role_definition_name = each.value.role
  principal_id         = azuread_application.local.application_id
}
