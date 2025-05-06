# Создаем облачную сеть
resource "yandex_vpc_network" "network" {
  name = var.network_name  # Используем переменную из variables.tf
  description = "Основная сеть для тестовых ВМ"
}

# Создаем подсеть в указанной зоне доступности
resource "yandex_vpc_subnet" "subnet" {
  name           = var.subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]  # Диапазон внутренних IP
}

# Первая ВМ: 2 vCPU, 4GB RAM
resource "yandex_compute_instance" "vm1" {
  name        = var.vm1_name
  platform_id = "standard-v2"  # Тип платформы

  resources {
    cores  = 2  # Количество ядер
    memory = 4  # Объем памяти в GB
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id  # Используем образ из переменной
      size     = 20  # Размер диска в GB
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true  # Включаем NAT для публичного доступа
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"  # SSH-ключ для доступа
  }
}

# Вторая ВМ: 2 vCPU, 2GB RAM
resource "yandex_compute_instance" "vm2" {
  name        = var.vm2_name
  platform_id = "standard-v2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.vm_image_id
      size     = 20
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/id_ed25519.pub")}"
  }
}