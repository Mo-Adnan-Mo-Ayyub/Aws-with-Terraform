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
}