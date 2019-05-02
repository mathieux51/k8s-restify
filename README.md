# Server

## Getting started

```sh
npm i
npm start
```

# Kubernetes

## Launch Cluster

```sh
minikube version
minikube start
minikube status
kubectl version
kubectl cluster-info
```

## Get pod name

```sh
kubectl get pods -o json | jq ".items[0].metadata.name"
```

## Create a pod

```sh
kubectl create -f src/k8s/pods/redis.yml
kubectl exec -it redis redis-cli ping
# PONG
kubectl delete pod redis
```

## Minikube

To use Minikube instead of pushing the Docker image to a registry, we can build the image using the same Docker host as the Minikube VM.

```sh
eval $(minikube docker-env)
# To undo
eval $(minikube docker-env -u)
```

```sh
docker build -t k8s-restify:1.0 .
kubectl run k8s-restify --image=k8s-restify:1.0 --port=8080 --image-pull-policy=Never
kubectl expose deployment k8s-restify --type=LoadBalancer
minikube service k8s-restify
```

# To do

- [x] Deploy restify server
- [ ] Deploy redis
- [ ] Connect restify and redis
- [ ] Add tags for rollbacks
