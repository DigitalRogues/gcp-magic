#!/bin/bash
#use apply instead of create so I can easily re-apply any updates. just by re-running the command after the yaml is updated

#mongo
kubectl apply -f mongo/mongo-deploy.yaml
kubectl apply -f mongo/mongo-service.yaml

#web scraper
kubectl apply -f scrape/scrape-deploy.yaml

#api
kubectl apply -f api/api-deploy.yaml
kubectl apply -f api/api-service.yaml