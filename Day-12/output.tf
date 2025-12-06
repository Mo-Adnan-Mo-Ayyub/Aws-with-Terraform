output "formatted_project_name_output" {
  value = local.formatted_project_name
}

output "formatted_port_list" {
  value = local.port_list
}

output "formatted_sg_rules" {
  value = local.sg_rules
}

output "instance_sizes" {
  value = local.instance_sizes
}

output "credentials" {
  value     = var.credentials
  sensitive = true
}

output "all_locations" {
  value = local.all_locations
}

output "uniqe_locations" {
  value = local.uniqe_locations
}

output "cost_analysis" {
  value = {
    max_cost   = local.max_cost
    min_cost   = local.min_cost
    total_cost = local.total_cost
    avg_cost   = local.avg_cost
  }
}

output "time" {
  value = local.current_time
}

output "backup_time" {
  value = local.timestamp_name
}

output "config" {
  value = local.config_data
}