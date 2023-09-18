# Инфраструктурный репозиторий для облака timeweb cloud

## Описание

Данный репозиторий содержит инфраструктуру для облака timeweb cloud. В настоящий момент умеет работать с ресурсами следующего типа:
* [SSH ключи](https://github.com/timeweb-cloud/terraform-provider-timeweb-cloud/blob/main/docs/data-sources/ssh_keys.md)
* [Сервер с предустановленным ПО](https://github.com/timeweb-cloud/terraform-provider-timeweb-cloud/blob/main/docs/resources/server.md)
* [Сервер из пресета](https://github.com/timeweb-cloud/terraform-provider-timeweb-cloud/blob/main/docs/resources/server.md)

Для создания серверов используются [presets](https://github.com/timeweb-cloud/terraform-provider-timeweb-cloud/blob/main/docs/data-sources/presets.md), так как сервера, созданные по типовым конфигурациям стоят дешевле. Поэтому нужно указывать параметры сервера, точно соответствующие одному из пресетов. Список пресетов можно получить через [API](https://api.timeweb.cloud/api/v1/presets/servers), пример ответа лежит в файле [response.json](response.json), посмотреть в виде таблицы можно [тут](presets.md).

## Запуск

Создать файл `terraform.tfvars` с указанием значений переменных. Пример файла [terraform.tfvars.example](terraform.tfvars.example)

```shell
terraform init
terraform plan
terraform apply
```
