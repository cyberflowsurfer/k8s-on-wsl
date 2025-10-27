#!/bin/bash
# Forward port 8443 on localhost to the Kubernetes Dashboard service in the kubernetes-dashboard namespace
# Reference: https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/#

kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443