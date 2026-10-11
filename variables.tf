variable "nosql_configurations" {
  description = <<EOT
Map of nosql_configurations, attributes below
Required:
    - compartment_id
    - environment
Optional:
    - is_opc_dry_run
    - kms_key (block):
        - id (optional)
        - kms_key_state (optional)
        - kms_vault_id (optional)
        - time_created (optional)
        - time_updated (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    environment    = string
    is_opc_dry_run = optional(bool)
    kms_key = optional(object({
      id            = optional(string)
      kms_key_state = optional(string)
      kms_vault_id  = optional(string)
      time_created  = optional(string)
      time_updated  = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.nosql_configurations : (
        contains([for v in ["HOSTED", "MULTI_TENANCY"] : lower(v)], lower(v.environment))
      )
    ])
    error_message = "must be one of: \"HOSTED\", \"MULTI_TENANCY\""
  }
}

