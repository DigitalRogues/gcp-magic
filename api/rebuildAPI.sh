#!/bin/bash
NUM=3
IMAGE=us.gcr.io/magic-cluster/magicapi:0.$NUM
docker build -t $IMAGE .
gcloud docker -- push $IMAGE
#update deployment in cluster
#kubectl set image deployment/api-deploy api=$IMAGE

