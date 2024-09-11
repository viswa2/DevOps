variable "splunk" {
  default = "8088"
}

variable "ingress_cidr_block" {
    type = string
    default = "172.31.0.0/16"
}

variable "egress_cidr_block" {
    type = string
    default = "0.0.0.0/0"
}

variable "http_port" {
    type = string
    default = "8080"
}

variable "https_port" {
    type = string
    default = "443"
}

variable "ingress" {
    type = string
    default = "8443"
}