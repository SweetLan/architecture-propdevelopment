# Таблица ролей RBAC для Kubernetes в PropDevelopment

| Роль | Права роли | Группы пользователей |
| --- | --- | --- |
| namespace-viewer | Просмотр ресурсов в рамках одного namespace: pods, pods/log, services, deployments, replicasets, configmaps, ingresses, events. Только verbs: get, list, watch. | Операционные команды, менеджеры домена, сотрудники, которым нужен только просмотр состояния сервисов. |
| namespace-operator | Управление ресурсами только своего namespace: pods, deployments, services, configmaps, jobs, cronjobs, ingresses. Verbs: get, list, watch, create, update, patch, delete. Без доступа к secrets. | Разработчики и инженеры эксплуатации продуктовых команд доменов sales, tenant, finance, data. |
| secret-reader | Просмотр secrets только в выделенном чувствительном namespace. Verbs: get, list. | Специалист по ИБ, сотрудники, отвечающие за безопасность интеграций и аудит. |
| cluster-auditor | Просмотр общекластерных ресурсов: namespaces, nodes, pods, events. Только verbs: get, list, watch. | Центральная DevOps/инфраструктурная команда, аудиторы безопасности. |
