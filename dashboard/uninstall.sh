#!/bin/bash 
# Uninstall the Kubernetes Dashboard from the cluster
# Reference: https://gist.github.com/andrewfinnell/bcca20a940b17fcea793d593b56155d3
kubectl get deployments -A
kubectl delete service kubernetes-dashboard  --namespace=kubernetes-dashboard
kubectl delete service dashboard-metrics-scraper  --namespace=kubernetes-dashboard
kubectl delete sa kubernetes-dashboard --namespace=kubernetes-dashboard
kubectl delete secret kubernetes-dashboard-certs --namespace=kubernetes-dashboard
kubectl delete secret kubernetes-dashboard-key-holder --namespace=kubernetes-dashboard