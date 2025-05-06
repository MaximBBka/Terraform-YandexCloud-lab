output "vm1_public_ip" {
  description = "Публичный IP адрес первой ВМ"
  value       = yandex_compute_instance.vm1.network_interface.0.nat_ip_address
}

output "vm2_public_ip" {
  description = "Публичный IP адрес второй ВМ"
  value       = yandex_compute_instance.vm2.network_interface.0.nat_ip_address
}

output "vm1_internal_ip" {
  description = "Внутренний IP первой ВМ"
  value       = yandex_compute_instance.vm1.network_interface.0.ip_address
}

output "vm2_internal_ip" {
  description = "Внутренний IP второй ВМ"
  value       = yandex_compute_instance.vm2.network_interface.0.ip_address
}

output "ssh_command_vm1" {
  description = "Команда для подключения к первой ВМ"
  value       = "ssh ubuntu@${yandex_compute_instance.vm1.network_interface.0.nat_ip_address}"
}