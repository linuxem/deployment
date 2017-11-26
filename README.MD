#Running local kubernetes

1. start minikube  
`$ curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/`  
`$ curl -Lo kubectl https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl && chmod +x kubectl && sudo mv kubectl /usr/local/bin/`  
`$ minikube start --cpus 3 --memory=8192 --insecure-registry localhost:5000`
2. to launch the dashboard  
`minikube dashboard`
3. setup local registry  
storage:  
`$ sudo mkdir -p /home/storage`  
`$ chown -R $USER /home/storage`  
`$ eval $(minikube docker-env)` this sets the system to use the minikube docker deamon  
`$ kubectl apply -f helpers/registry.yml`
4. now you can tag and push images to the registry as `localhost:5000/sound/repo:vXXX`  

#Build images
1. set docker env  
`$ eval $(minikube docker-env)` this sets the system to use the minikube docker deamon  
2. build images
`$ ./buildAll.sh` this builds and pushes to the local registry

#Start 3rd party 
1. start redis  
`$ kubectl apply -f redis.yml`
2. start etcd   
`$ kubectl apply -f beta/etcd-operator.yml`  
wait for etcd-operator to start
`$ kubectl apply -f beta/etcd.yml`

#start apps
1. `$ kubectl apply -f api-server.yml`
2. `$ kubectl apply -f pipeline-driver.yml`