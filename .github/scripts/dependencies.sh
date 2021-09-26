#!/usr/bin/env bash
set -eux
set -o pipefail

sudo apt-get purge moby-buildx moby-cli moby-containerd moby-engine moby-runc buildah podman
sudo rm -rv /etc/docker

wget -P /tmp https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/containerd.io_1.2.6-3_amd64.deb
wget -P /tmp https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce-cli_19.03.5~3-0~ubuntu-bionic_amd64.deb
wget -P /tmp https://download.docker.com/linux/ubuntu/dists/bionic/pool/stable/amd64/docker-ce_19.03.5~3-0~ubuntu-bionic_amd64.deb
sudo dpkg -i /tmp/*.deb

wget -P /tmp https://storage.googleapis.com/kubernetes-release/release/v1.16.6/bin/linux/amd64/kubectl
sudo install /tmp/kubectl /usr/local/bin/kubectl

wget -P /tmp https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz
tar -C /tmp -xvf /tmp/helm-v3.5.3-linux-amd64.tar.gz
sudo install /tmp/linux-amd64/helm /usr/local/bin/helm

sudo apt-get install git-flow

pip install setuptools
pip install wheel
pip install yq
echo ~/.local/bin >> $GITHUB_PATH