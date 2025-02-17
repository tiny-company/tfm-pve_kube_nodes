## promox vars

variable "terraform_proxmox_node_name" {
  type      = string
  sensitive = true
}

variable "terraform_proxmox_lxc_highest_id_value" {
  type      = number
  sensitive = true
}

## kube node variables

variable "kube_node_number" {
  type      = number
  default   = 3
}

variable "kube_node_description" {
  type      = string
  default   = "Kubernetes node"
}

variable "kube_node_cpu_arch" {
  type      = string
  default   = "amd64"
}

variable "kube_node_cpu_cores" {
  type      = number
  default   = 2
}

variable "kube_node_disk_datastore" {
  type      = string
  sensitive = true
}

variable "kube_node_disk_size" {
  type      = number
  default   = 10
}

variable "kube_node_mem_dedi" {
  type      = number
  default   = 1024
}

variable "kube_node_mem_swap" {
  type      = number
  default   = 256
}

variable "kube_node_os_templ_file" {
  type      = string
  sensitive = true
}

variable "kube_node_os_type" {
  type      = string
  default   = "debian"
}

variable "kube_node_hostname" {
  type      = string
  sensitive = true
}

variable "kube_node_ipv4_start_addr" {
  type      = number
  sensitive = true
}

variable "kube_node_ipv4_mask" {
  type      = string
  default   = "/24"
}

variable "kube_node_ipv4_gw" {
  type      = string
  sensitive = true
}

variable "kube_node_ssh_pub_keys" {
  type      = list(string)
  sensitive = true
}

variable "kube_node_net_int_name" {
  type      = string
  sensitive = true
}

variable "kube_node_net_bridge_int_name" {
  type      = string
  sensitive = true
}

variable "kube_node_default_username" {
  type      = string
  default   = "root"
}
