# Task4

В рамках задания настроена ролевая модель RBAC для Kubernetes-кластера Minikube.

## Namespace
- sales
- tenant
- finance
- data
- security

## Роли
- namespace-viewer
- namespace-operator
- secret-reader
- cluster-auditor

## Пользователи
- viewer1 -> viewers
- operator1 -> operators
- security1 -> security
- auditor1 -> auditors

## Проверка
- viewer1 может просматривать pods в sales, но не имеет доступа к secrets
- operator1 может создавать deployment в sales, но не имеет доступа к secrets
- security1 может просматривать secrets в security
- auditor1 может просматривать nodes и pods во всём кластере