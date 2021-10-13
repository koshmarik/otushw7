#!/bin/bash

function start() {
  helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
  helm repo add bitnami https://charts.bitnami.com/bitnami

  helm install postgres bitnami/postgresql -f ./postgresql.yml
  helm install rabbitmq bitnami/rabbitmq
  helm install kafka bitnami/kafka -f ./kafka.yml
  helm install ilibrary ./ilibrary-chart
  return
}

function finish() {
  helm uninstall ilibrary
  helm uninstall kafka
  helm uninstall postgres
  return
}

case "$1" in
"start")
  start
  ;;
"stop")
  finish
  ;;
esac