#!/bin/bash

#be sure docker images are pushed to a registry

#create project
#gcloud projects create magic-cluster --name="Magic K8s"

#get creds
#gcloud container clusters get-credentials magic --zone us-west1-b --project magic-cluster


##ugly ugly command, needs to be wrapped in terraform or something soon
#create cluster
# gcloud beta container --project "magic-cluster" clusters create "magic-cluster" --zone "us-west1-b" --username="admin" --cluster-version "1.7.2" --machine-type "f1-micro" --image-type "COS" --disk-size "100" --scopes "https://www.googleapis.com/auth/compute","https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "3" --network "default" --enable-cloud-logging --no-enable-cloud-monitoring --enable-legacy-authorization


#the hierarchy
#kubectl describe deployment mongo
#    kubectl describe service mongo
#        kubectl describe pod mongo

#update deployment  - this is the shitty way use kubectl apply -f to control state form a file.
#kubectl set image deployment/scrape-deploy scrape=us.gcr.io/magic-cluster/magicscrape:0.3