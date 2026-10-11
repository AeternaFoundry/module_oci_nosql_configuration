output "nosql_configurations_id" {
  description = "Map of id values across all nosql_configurations, keyed the same as var.nosql_configurations except keys with no id are omitted"
  value       = { for k, v in oci_nosql_configuration.nosql_configurations : k => v.id if v.id != null && length(v.id) > 0 }
}
output "nosql_configurations_compartment_id" {
  description = "Map of compartment_id values across all nosql_configurations, keyed the same as var.nosql_configurations except keys with no compartment_id are omitted"
  value       = { for k, v in oci_nosql_configuration.nosql_configurations : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "nosql_configurations_environment" {
  description = "Map of environment values across all nosql_configurations, keyed the same as var.nosql_configurations except keys with no environment are omitted"
  value       = { for k, v in oci_nosql_configuration.nosql_configurations : k => v.environment if v.environment != null && length(v.environment) > 0 }
}
output "nosql_configurations_is_opc_dry_run" {
  description = "Map of is_opc_dry_run values across all nosql_configurations, keyed the same as var.nosql_configurations except keys with no is_opc_dry_run are omitted"
  value       = { for k, v in oci_nosql_configuration.nosql_configurations : k => v.is_opc_dry_run if v.is_opc_dry_run != null }
}
output "nosql_configurations_kms_key" {
  description = "Map of kms_key values across all nosql_configurations, keyed the same as var.nosql_configurations except keys with no kms_key are omitted"
  value       = { for k, v in oci_nosql_configuration.nosql_configurations : k => one(v.kms_key) if v.kms_key != null && length(v.kms_key) > 0 }
}

