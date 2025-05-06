# Основные параметры Yandex.Cloud
variable "yandex_cloud_id" {
  description = "ID облака в Yandex.Cloud"
  type        = string
  sensitive   = true  # Помечаем как чувствительное значение
}

variable "yandex_folder_id" {
  description = "ID каталога в Yandex.Cloud"
  type        = string
  sensitive   = true
}

# Настройки сети
variable "network_name" {
  description = "Имя создаваемой облачной сети"
  type        = string
  default     = "yc-network"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "yc-subnet"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"  # Рекомендуемая зона
}

# Параметры виртуальных машин
variable "vm1_name" {
  description = "Имя первой ВМ (2 vCPU, 4GB RAM)"
  type        = string
  default     = "master-node"
}

variable "vm2_name" {
  description = "Имя второй ВМ (2 vCPU, 2GB RAM)"
  type        = string
  default     = "worker-node-1"
}

variable "vm_image_id" {
  description = "ID образа для ВМ (Ubuntu 24.04 LTS)"
  type        = string
  default     = "fd8bbhtvdodbbranefoe"
}