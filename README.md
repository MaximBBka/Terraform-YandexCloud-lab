# Лабораторная работа: Развертывание инфраструктуры в Yandex Cloud через Terraform

## Подготовка к работе

### 1. Установка Terraform
```bash
sudo snap install terraform --classic
```

### 2. Настройка зеркала для РФ (актуально на 06.05.2025)
Создайте файл `.terraformrc` с содержимым:
```hcl
provider_installation {
  network_mirror {
    url     = "https://registry.comcloud.xyz/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```
Перенесите файл:
```bash
mv .terraformrc ~/
```

### 3. Конфигурационные параметры
В файле `terraform.tfvars` укажите:
- **Cloud_ID** (Находится: Аккаунт → Привязанные облака → Идентификатор)
- **Folder_ID** (Консоль Yandex Cloud → верхняя панель → ID каталога)

### 4. Настройка доступа
1. Создайте сервисный аккаунт в IAM с правами `admin` (для тестов)
2. Сгенерируйте IAM-токен, сачайте и положите в папку с проектом или укажите путь к нему в `provider.tf`

## Запуск проекта
```bash
terraform init     # Инициализация
terraform plan     # Просмотр изменений
terraform apply    # Применение конфигурации
```

## Проверка результатов
Откройте [консоль Yandex Cloud](https://console.cloud.yandex.ru) для проверки созданных ресурсов.

## Troubleshooting
1. **Проблемы с зеркалом**:  
   Проверьте доступность `https://registry.comcloud.xyz/`. Если недоступно — найдите актуальное зеркало.

2. **Ошибки аутентификации**:  
   Перепроверьте:
   - Корректность Cloud_ID и Folder_ID
   - Срок действия IAM-токена
   - Права сервисного аккаунта

3. **Прочие ошибки**:  
   Анализируйте вывод в консоли. Частые решения:
   ```bash
   terraform refresh    # Обновление состояния
   terraform validate   # Проверка синтаксиса
   ```
