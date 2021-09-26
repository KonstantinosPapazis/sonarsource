#!/usr/bin/env bash
set -eux
set -o pipefail

if [[ -z $(kubectl get ns | grep monitoring) ]]; then
  kubectl create ns monitoring
fi

if [[ -z $(kubectl get ns | grep vote) ]]; then
  kubectl create ns vote
fi


#GKE requirement for creating roles for prometheus
if [[ -z $(kubectl get clusterrolebinding | grep owner-cluster-admin-binding) ]]; then
  ACCOUNT=$(gcloud info --format='value(config.account)')
  kubectl create clusterrolebinding owner-cluster-admin-binding \
      --clusterrole cluster-admin \
      --user $ACCOUNT
fi
