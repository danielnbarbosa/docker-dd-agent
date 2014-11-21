#! /bin/bash

SHA1=$1

# Deploy image to Docker Hub
#docker push danielnbarbosa/dd-agent:$SHA1
docker push danielnbarbosa/dd-agent

# Deploy to CoreOS cluster
ssh core@54.67.14.65 -C 'fleetctl stop dd-agent@{1..3}.service; fleetctl start dd-agent@{1..3}.service'
