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

### `docker-env`

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

### Dashboard

```sh
minikube dashboard
```

## `kubectl expose`

```sh
kubectl get deployments
kubectl get services
kubectl create -f src/k8s/deployments/k8s-restify.yaml
kubectl get deployments
kubectl get services k8s-restify
curl $(minikube ip):$(kubectl get services k8s-restify -o json | jq ".spec.ports[0].nodePort")/hello/Mat
```

# To do

- [x] Deploy restify server
- [ ] Deploy redis
- [ ] Connect restify and redis
- [ ] Deploy Go helloWorld server
- [ ] Deploy Postgres
- [ ] Add tags for rollbacks
