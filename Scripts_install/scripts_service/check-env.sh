#!/bin/bash

clear
printf "\n\n --- Check Pods ---\n\n"
kubectl get pods --all-namespaces

printf "\n\n --- Check Servers ---\n\n"
kubectl get svc --all-namespaces

printf "\n"


