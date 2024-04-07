#!/bin/bash

# Apply PVCs
kubectl apply -f ../volumes/kafka-pvc.yaml
kubectl apply -f ../volumes/zookeeper-pvc.yaml

# Deploy Zookeeper
kubectl apply -f ../zookeeper/deployment.yaml
kubectl apply -f ../zookeeper/service.yaml

# Deploy Kafka
kubectl apply -f ../kafka/deployment.yaml
kubectl apply -f ../kafka/service.yaml

echo "PVCs, Zookeeper, and Kafka have been deployed."
