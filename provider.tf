# Блок required_providers должен быть в каждом модуле
terraform {
  required_providers {
    yandex = {
      source  = "registry.terraform.io/yandex-cloud/yandex"  # Источник из mirror
      version = "0.89.0"  # Фиксируем версию для стабильности
    }
  }
}

# Конфигурация провайдера Yandex.Cloud
provider "yandex" {
  cloud_id  = var.yandex_cloud_id   # ID облака (обязательно)
  folder_id = var.yandex_folder_id  # ID каталога (обязательно)
  zone      = var.zone              # Зона доступности (по умолчанию ru-central1-a)
  service_account_key_file = "authorized_key.json"
}