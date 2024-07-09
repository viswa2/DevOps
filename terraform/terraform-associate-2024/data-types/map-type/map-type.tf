variable "my-map" {
    type = map
    default = {
        Name = "alice"
    }
}

output "variable_value" {
    value = var.my-map
}