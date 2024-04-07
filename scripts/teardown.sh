#!/bin/bash

# Delete Kafka
kubectl delete -f ../kafka/deployment.yaml
kubectl delete -f ../kafka/service.yaml

# Delete Zookeeper
kubectl delete -f ../zookeeper/deployment.yaml
kubectl delete -f ../zookeeper/service.yaml

# Delete PVCs
kubectl delete -f ../volumes/kafka-pvc.yaml
kubectl delete -f ../volumes/zookeeper-pvc.yaml

echo "Zookeeper and Kafka have been removed."
