sudo kubeadm reset
sudo rm -r $HOME/.kube/config
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
sudo mkdir -p $HOME/.kube 
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config 
sudo chown $(id -u):$(id -g) $HOME/.kube/config
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f kubernetes_files/deployments/hello-world.yml
kubectl apply -f kubernetes_files/deployments/product-descp.yml
kubectl apply -f kubernetes_files/deployments/product-price.yml
kubectl apply -f kubernetes_files/deployments/server.yml
kubectl apply -f kubernetes_files/services/hello-world.yml
kubectl apply -f kubernetes_files/services/product-descp.yml
kubectl apply -f kubernetes_files/services/product-price.yml
kubectl apply -f kubernetes_files/services/server.yml
sudo kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='^*$'&