variable "vpn_ip" {
  default = "10.20.30.50/32"
}

variable "app_port" {
  description = "This is application port"
  default     = "8080"
}

variable "ssh_port" {
  default = "22"
}

variable "ftp_port" {
  default = "21"
}