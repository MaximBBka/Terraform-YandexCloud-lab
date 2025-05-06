Это лаба для работы с Terraform, развертывания виртуальных машин в YandexCloud

Как подготовить к работе:
1. Установите Terraform
- sudo snap install terraform --classic

2. Создайте файл .terraformrc (Для обхода блокировки в РФ)
- Положите туда: 
provider_installation {
  network_mirror {
    url     = "https://registry.comcloud.xyz/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
- Выполните команду: mv .terraformrc ~/

3. В файле terraform.tfvars нужно указать:
- CloudID. Находиться: Заходите в ваш аккаунт > Привязанные облака и сервисы > 	Идентификатор.
- FolderID. Находиться: Гланый экран консоли > Сверху по центру идентификатор каталога.

4. Что бы Terraform мог получить доступ к созданию сервисом в YandexCloud нужно:
- Создать сервисный аккаунт(IAM), указать нужные права. Для теста можно admin.
- Создать IAM-токен и скачать его, после положить внутрь проекта или поменять путь к файлу с ключом в файле provider.tf.

Как запустить:
1. terraform init
2. terraform plan
3. terraform apply

Итог:
1. Проверяйте в консоли YandexCloud созданные сервисы.

Траблшутинг:
1. Проверьте доступность url из 2 пункта. Если не доступен ищете доступный regestry. (Актуально 06.05.2025)
2. Не верно указанны данные из YandexCloud, перепроверьте.
3. Остальное подскажет консоль)
