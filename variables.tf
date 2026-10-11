variable "cognitive_account_connection_api_keys" {
  description = <<EOT
Map of cognitive_account_connection_api_keys, attributes below
Required:
    - api_key
    - api_key_key_vault_id (optional, alternative to api_key)
    - api_key_key_vault_secret_name (optional, alternative to api_key)
    - category
    - cognitive_account_id
    - name
Optional:
    - metadata
    - target
EOT

  type = map(object({
    api_key                       = string
    api_key_key_vault_id          = optional(string)
    api_key_key_vault_secret_name = optional(string)
    category                      = string
    cognitive_account_id          = string
    name                          = string
    metadata                      = optional(map(string))
    target                        = optional(string)
  }))
}

