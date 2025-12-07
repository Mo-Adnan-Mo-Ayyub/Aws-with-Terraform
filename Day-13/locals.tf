locals {
  formatted_project_name = lower(replace(var.project_name, " ", "-"))

  required_tags = merge(var.default_tags, var.environment_tags)

  # formatted_bucket_name  = substr(lower(replace(trim(var.bucket_name, " ", "-")), "!!!", ""), 0, 63)
  formatted_bucket_name = replace(replace(substr(lower(var.bucket_name), 0, 63), " ", "-"), "!", "")

  port_list = split(",", var.allowed_ports)

  sg_rules = [for port in local.port_list :
    {
      name         = "port-${port}"
      port         = port
      descriptoion = "Allow traffic on port ${port}"
    }
  ]

  instance_sizes = lookup(var.instance_sizes, var.environment, "t3.micro")

  all_locations = concat(var.user_location, var.default_location)

  uniqe_locations = toset(local.all_locations)

  positive_costs = [for cost in var.monthly_costs : abs(cost)]

  max_cost = max(local.positive_costs...)

  min_cost = min(local.positive_costs...)

  total_cost = sum(local.positive_costs)

  avg_cost = local.total_cost / length(local.positive_costs)

  current_time = timestamp()

  format_1 = formatdate("DD-MM-YYYY", local.current_time)

  format_2 = formatdate("YYYYMMDD", local.current_time)

  timestamp_name = "backup-${local.format_1}"

  config_file_exist = fileexists("./config.json")

  config_data = local.config_file_exist ? jsondecode(file("./config.json")) : {}
}