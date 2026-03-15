#!/bin/bash
set -e

mkdir -p certs

# Явно указываем путь к CA Minikube для Windows + Git Bash
MINIKUBE_CA_CRT="/c/Users/svans/.minikube/ca.crt"
MINIKUBE_CA_KEY="/c/Users/svans/.minikube/ca.key"

create_user () {
  USERNAME=$1
  GROUP=$2

  openssl genrsa -out certs/${USERNAME}.key 2048

  MSYS_NO_PATHCONV=1 openssl req -new -key certs/${USERNAME}.key \
    -out certs/${USERNAME}.csr \
    -subj "/CN=${USERNAME}/O=${GROUP}"

  openssl x509 -req \
    -in certs/${USERNAME}.csr \
    -CA "${MINIKUBE_CA_CRT}" \
    -CAkey "${MINIKUBE_CA_KEY}" \
    -CAcreateserial \
    -out certs/${USERNAME}.crt \
    -days 365
}

create_user viewer1 viewers
create_user operator1 operators
create_user security1 security
create_user auditor1 auditors

kubectl config set-credentials viewer1 --client-certificate=certs/viewer1.crt --client-key=certs/viewer1.key --embed-certs=true
kubectl config set-credentials operator1 --client-certificate=certs/operator1.crt --client-key=certs/operator1.key --embed-certs=true
kubectl config set-credentials security1 --client-certificate=certs/security1.crt --client-key=certs/security1.key --embed-certs=true
kubectl config set-credentials auditor1 --client-certificate=certs/auditor1.crt --client-key=certs/auditor1.key --embed-certs=true

CLUSTER_NAME=minikube

kubectl config set-context viewer1-context --cluster=$CLUSTER_NAME --user=viewer1 --namespace=sales
kubectl config set-context operator1-context --cluster=$CLUSTER_NAME --user=operator1 --namespace=sales
kubectl config set-context security1-context --cluster=$CLUSTER_NAME --user=security1 --namespace=security
kubectl config set-context auditor1-context --cluster=$CLUSTER_NAME --user=auditor1