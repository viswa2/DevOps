variable "my-map" {
  type = map(any)
  default = {
    Name = "alice"
  }
}

output "variable_value" {
  value = var.my-map
}