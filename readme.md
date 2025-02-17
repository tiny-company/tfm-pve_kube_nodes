# tfm-tfm-pve_kube_nodes

## Description

A simple terraform module that create a kubernetes nodes in proxmox provider.

## prerequisite

- This module has dependency to the [tfm-pve_kube_master](https://github.com/tiny-company/tfm-pve_kube_master) because it get the next container id after the one defined by the master (`module.proxmox-kube_master.kube_master_highest_vmid`), installation and configuration element are not included here, see related [git readme](https://github.com/tiny-company/tfm-pve_kube_master/blob/main/readme.md)

## Usage 

- Import the module by referencing it in your main terraform file (`main.tf`) using :
```hcl
## Create Kubernetes nodes ressource
module "proxmox-kube_node" {
  source = "git::https://github.com/tiny-company/tfm-pve_kube_nodes"
  kube_node_description = var.kube_node_description
  terraform_proxmox_node_name = var.terraform_proxmox_node_name
  terraform_proxmox_lxc_highest_id_value = module.proxmox-kube_master.kube_master_highest_vmid
  kube_node_cpu_arch = var.kube_node_cpu_arch
  kube_node_cpu_cores = var.kube_node_cpu_cores
  kube_node_disk_datastore = var.kube_node_disk_datastore
  kube_node_disk_size = var.kube_node_disk_size
  kube_node_mem_dedi = var.kube_node_mem_dedi
  kube_node_mem_swap = var.kube_node_mem_swap
  kube_node_os_templ_file = var.kube_node_os_templ_file
  kube_node_os_type = var.kube_node_os_type
  kube_node_hostname = var.kube_node_hostname
  kube_node_ipv4_start_addr = var.kube_node_ipv4_start_addr
  kube_node_ipv4_mask = var.kube_node_ipv4_mask
  kube_node_ipv4_gw = var.kube_node_ipv4_gw
  kube_node_ssh_pub_keys = var.default_root_ssh_pub_keys
  kube_node_net_int_name = var.kube_node_net_int_name
  kube_node_net_bridge_int_name = var.kube_node_net_bridge_int_name
}
```

- Don't forget to define the vars below in your main variables.tf :
```hcl
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
```

- And finally don't forget to set **these vars** and **the vars for the proxmox/bpg provider** in a .tfvars (i.e: `terraform.tfvars`) file  :
```hcl
pve_endpoint="https://proxmox_endpoint_url/"
pve_token="proxmox_username@authentication_base!token_name=0000000-00000-00000-000000-4532433"
terraform_proxmox_node_name="proxmox_node"
terraform_proxmox_templ_loc="proxmox_template_location"
default_root_ssh_pub_keys=["ssh-rsa public_key_to_be_installed_on_the_kube_instances"]
kube_node_description="kube node for testing kubernetes"
kube_node_cpu_arch="amd64"
kube_node_cpu_cores=2
kube_node_disk_datastore="local-lvm"
kube_node_disk_size=10
kube_node_mem_dedi=1024
kube_node_mem_swap=256
kube_node_os_templ_file="local:vztmpl/debian-12-standard_12.7-1_amd64.tar.zst"
kube_node_os_type="debian"
kube_node_hostname="test-kube-node-test"
kube_node_ipv4_start_addr=55
kube_node_ipv4_mask="/24"
kube_node_ipv4_gw="192.168.1.1"
kube_node_net_int_name="eth0"
kube_node_net_bridge_int_name="vmbr1"
```

## Sources : 

- [tutorial terraform module](https://developer.hashicorp.com/terraform/tutorials/modules/module)
- [terraform module creation guide](https://developer.hashicorp.com/terraform/language/modules/develop)
- [terraform module source](https://developer.hashicorp.com/terraform/language/modules/sources#github)
- [terraform module git private repo source](https://medium.com/@dipandergoyal/terraform-using-private-git-repo-as-module-source-d20d8cec7c5)