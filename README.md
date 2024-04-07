# Kafka-Zookeeper Kubernetes Deployment

This repository contains Kubernetes configurations for deploying a basic Kafka cluster with Zookeeper coordination. This setup is designed to be a starting point for running Kafka within Kubernetes and should be tailored to fit your specific requirements.

## Prerequisites

- A Kubernetes cluster
- `kubectl` configured to communicate with your cluster
- Basic understanding of Kubernetes concepts (Pods, Deployments, Services)

## Structure

- `kafka/`: Contains Kafka deployment and service configurations.
- `zookeeper/`: Contains Zookeeper deployment and service configurations.
- `volumes/`: Persistent volume claims for Kafka and Zookeeper data.
- `config/`: Configuration files and ConfigMaps for Kafka and Zookeeper.
- `scripts/`: Utility scripts to help deploy and manage the infrastructure.

## Deployment Steps

1. **Clone the Repository**

   Start by cloning this repository to your local machine or download the configurations directly from the web interface.

   ```
   git clone https://github.com/cyborgx0x/message-stream
   cd message-stream
   ```

2. **Apply Persistent Volume Claims**

   Before deploying Kafka and Zookeeper, create the persistent volume claims to ensure data persistence.

   ```
   kubectl apply -f volumes/kafka-pvc.yaml
   kubectl apply -f volumes/zookeeper-pvc.yaml
   ```

3. **Deploy Zookeeper**

   Zookeeper is a dependency for Kafka, so it needs to be deployed first.

   ```
   kubectl apply -f zookeeper/deployment.yaml
   kubectl apply -f zookeeper/service.yaml
   ```

   Verify that Zookeeper is running:

   ```
   kubectl get pods -l app=zookeeper
   ```

4. **Deploy Kafka**

   Once Zookeeper is up, deploy Kafka.

   ```
   kubectl apply -f kafka/deployment.yaml
   kubectl apply -f kafka/service.yaml
   ```

   Check Kafka deployment:

   ```
   kubectl get pods -l app=kafka
   ```

5. **Accessing Kafka**

   Kafka is now accessible within your cluster at `kafka:9092`. To interact with Kafka from outside the cluster, consider exposing Kafka through a NodePort or LoadBalancer service, or use port forwarding:

   ```
   kubectl port-forward svc/kafka 9092:9092
   ```

   **Note:** Exposing Kafka to the outside world requires careful consideration of security implications.

## Managing the Deployment

- **Scaling Kafka**: To scale your Kafka deployment, adjust the `replicas` field in `kafka/deployment.yaml` and apply the changes.

  ```
  kubectl scale deployment/kafka --replicas=<number-of-replicas>
  ```

- **Monitoring**: Implement monitoring and logging solutions like Prometheus and Grafana for Kafka and Zookeeper metrics.

- **Updating Configurations**: To update Kafka or Zookeeper configurations, modify the respective ConfigMap and redeploy the affected components.

## Cleanup

To remove the deployed resources from your cluster, run:

```
kubectl delete -f kafka/
kubectl delete -f zookeeper/
kubectl delete -f volumes/
```

## Contributing

Contributions to improve the deployment are welcome. Please follow the standard Git workflow - fork, branch, commit, and submit a pull request.

---
