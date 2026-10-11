data "azurerm_key_vault_secret" "api_key" {
  for_each     = { for k, v in var.cognitive_account_connection_api_keys : k => v if v.api_key_key_vault_id != null && v.api_key_key_vault_secret_name != null }
  name         = each.value.api_key_key_vault_secret_name
  key_vault_id = each.value.api_key_key_vault_id
}
resource "azurerm_cognitive_account_connection_api_key" "cognitive_account_connection_api_keys" {
  for_each = var.cognitive_account_connection_api_keys

  api_key              = each.value.api_key != null ? each.value.api_key : try(data.azurerm_key_vault_secret.api_key[each.key].value, null)
  category             = each.value.category
  cognitive_account_id = each.value.cognitive_account_id
  name                 = each.value.name
  metadata             = each.value.metadata
  target               = each.value.target
}

