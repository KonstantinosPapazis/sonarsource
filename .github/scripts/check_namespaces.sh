#!/usr/bin/env bash
set -eux
set -o pipefail

if [[ -z $(kubectl get ns | grep monitoring) ]]; then
  kubectl create ns monitoring
fi

if [[ -z $(kubectl get ns | grep vote) ]]; then
  kubectl create ns vote
fi
