#!/bin/bash 
# Install the Kubernetes Dashboard using Helm
# Reference: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/

if which helm >/dev/null 2>&1; then
    echo "Installing the Kubernetes Dashboard..."
    # Add kubernetes-dashboard repository
    helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
    # Deploy a Helm Release named "kubernetes-dashboard" using the kubernetes-dashboard chart
    helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
else
    echo "Helm is not installed; please install helm first."
    exit 1
fi
