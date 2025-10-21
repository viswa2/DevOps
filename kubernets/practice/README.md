kind create cluster --name=multinode --config ./kind-config.yaml
kubectl config use-context kind-my-first-cluster 
kubectl expose deploy nginx-deploy --port=80 --> it will create service
kubectl create deploy nginx-deploy --image=mekala/multistage:latest --dry-run=client -o yaml > ngin
x-deploy.yaml
created svc's
Deployed sample app and used node port service to test
kubectl create cm sample-cm --from-literal=first=viswanath --from-literal=last=reddy
create a config map and add the reference in deployment.yaml
kubectl create secret generic demo-secret --from-literal=password=testpass
k describe secret demo-secret --> you will see encrypted password
echo "dGVzdHBhc3M=" | base64 -d --> it will decode the password with plan text
echo "testpass" | base64 --> it will encrypt the password
create a secret
kubectl create secret docker-registry sample-docker-secret \
> --docker-email=mekala.viswanathreddy@gmail.com \
> --docker-username=mekala \
> --docker-password=<add pasword or authentication_token> \
> --docker-server=https://index.docker.io/v2
kubectl get secret
kubectl describe secret sample-docker-secret
k get secret sample-docker-secret -oyaml
echo "secret_key_json" | base64 -d
Then run secrets/deploy.yaml file and check either the image is pulling or not 
H
HPA:
kubectl apply -f hpa/deploy.yaml
kubectl delete -f hpa/service.yaml
kubectl top pod
kubectl autoscale deployment python-deploy --min=1 --max=3 --cpu-percent=15
k get hpa


