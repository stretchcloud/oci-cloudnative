#!/bin/bash
kubectl create namespace mushop
kubectl create namespace mushop-utilities
kubectl config set-context --current --namespace=mushop
helm dependency update deploy/complete/helm-chart/setup
helm install mushop-utils deploy/complete/helm-chart/setup --namespace mushop-utilities
sleep 10
helm install mushop deploy/complete/helm-chart/mushop -f deploy/complete/helm-chart/mushop/values-mock.yaml
kubectl get svc -n mushop-utilities | grep ingress-controller
