terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.69"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
    macaddress = {
      source = "ivoronin/macaddress"
      version = "0.3.2"
    }
  }
}