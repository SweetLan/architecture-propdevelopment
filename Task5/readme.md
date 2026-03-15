В кластере Kubernetes создано четыре сервиса:

- front-end
- back-end-api
- admin-front-end
- admin-back-end-api

Каждому сервису назначены метки role.

С помощью NetworkPolicy ограничен сетевой трафик:

- front-end может взаимодействовать только с back-end-api
- admin-front-end может взаимодействовать только с admin-back-end-api
- остальные соединения запрещены