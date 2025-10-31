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

=============
Volumes:
=============
ephemeral and presistent
empheral is empty directory
presistent --> PV and PVC
Create a pod with empty directory along with volume mounts inside a container
then kubectl exec -it nginx-pod  -- sh
cd /usr/share/nginx/html
create a file name called index.html
exit
kubectl describe pod nginx-pod
under volumes you can see:  Type: EmptyDir (a temporary directory that shares a pod's lifetime) Once pod deletes the path of staorage will gone

Test volume will available or not:
Delete the existing: k delete pod nginx-pod
create again: k apply -f pod.yaml
k exec -it nginx-pod -- bash
/usr/share/nginx/html
ls -lrt
No index.html
Note: Which means once pod deletes the storage will be gone.

PV and PVC:
PV: Persistent volume Storage admin
PVC: Persistent Volume Claim

How pv can be mounted and accessed by container:
ReadWriteOnce
ReadOnlyMany
ReadWriteMany

reclaim policies:
retain
delete
recycled(deprecated)

Static vs Dynamic provisioning

manually inside worker node created mkdir -p /mnt/dir
echo "learning kubernetes volumes" > index.html
Created a PV with reference to host path 
created a PVC with refrence to PV name
create a pod with volumes for refrence of PVC
Get inside the nginx-pod k exec -it nginx-pod -- sh
cd /usr/share/nginx/html  
cat index.html Output: learning kubernetes volumes
Even if you delete and re-create the pod also the above path data remain should be available

