output "kube_node_ipv4_addr" {
  description = "kube node ipv4 address"
  value = proxmox_virtual_environment_container.test_vigea_kube_node-test[*].initialization[0].ip_config[0].ipv4[0].address
  sensitive = true
}