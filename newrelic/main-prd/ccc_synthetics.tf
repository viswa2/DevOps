locals {
  script_file_paths = [
    "${var.path_module}synthetics/ccc_ibmmblt_check.js",
    "${var.path_module}synthetics/ccc_onespan_check.js",
    "${var.path_module}synthetics/ccc_emergency_act.js"
  ]
}

data "template_file" "ccc_health_script" {
  count    = length(var.urls)
  template = file(local.script_file_paths[count.index])

  vars = {
    url = var.urls[count.index]
  }
}

resource "newrelic_synthetics_monitor" "ccc_health_check" {
  count     = length(var.urls)
  name      = var.monitor_names[count.index]
  type      = "SCRIPT_API"
  frequency = "60"
  status    = "ENABLED"
  locations = ["AWS_EU_NORTH_1"]
}

resource "newrelic_synthetics_monitor_script" "ccc_health_script" {
  count      = length(var.urls)
  monitor_id = newrelic_synthetics_monitor.ccc_health_check[count.index].id
  text       = data.template_file.ccc_health_script[count.index].rendered
}