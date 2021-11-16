#!/bin/bash -v

docker_version=$(docker -v)
if [ "-1" == "-f" ]; then
  docker_version=""
fi

if [ -n "$docker_version" ]; then
  echo $docker_version
  echo exiting
  exit 0
fi

echo proceeding

# make sure there's no old instances of docker
apt-get remove \
        docker docker-engine docker.io containerd runc \
        -y || echo "not installed"


# make sure deps are installed
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# download the gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# put into sources.list
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# refresh index
apt-get update

# actually do the install
apt-get install docker-ce docker-ce-cli containerd.io -y

# make sure there is a "docker" group
sudo groupadd docker || echo "group already exists"

# make sure current use is in that group
sudo usermod -aG docker $USER

# refresh group list - this allows for running docker commands now.
newgrp docker 

docker -v
docker run hello-world

