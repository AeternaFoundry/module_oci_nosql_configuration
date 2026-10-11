resource "oci_nosql_configuration" "nosql_configurations" {
  for_each = var.nosql_configurations

  compartment_id = each.value.compartment_id
  environment    = each.value.environment
  is_opc_dry_run = each.value.is_opc_dry_run

  dynamic "kms_key" {
    for_each = each.value.kms_key != null ? [each.value.kms_key] : []
    content {
      id            = kms_key.value.id
      kms_key_state = kms_key.value.kms_key_state
      kms_vault_id  = kms_key.value.kms_vault_id
      time_created  = kms_key.value.time_created
      time_updated  = kms_key.value.time_updated
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

