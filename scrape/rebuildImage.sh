#!/bin/bash
NUM=11
IMAGE=us.gcr.io/magic-cluster/magicscrape:0.$NUM
docker build -t $IMAGE .
gcloud docker -- push $IMAGE
#update deployment in cluster
#kubectl set image deployment/scrape-deploy scrape=$IMAGE


