#/bin/bash

echo "[1] k8s Master Setup"

sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=192.168.33.10 > /dev/null
mkdir -p /home/vagrant/.kube
sudo cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
sudo chown vagrant:vagrant /home/vagrant/.kube/config
sudo -H -u vagrant bash -c 'kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/canal.yaml' > /dev/null
sudo -H -u vagrant bash -c 'kubeadm token create --print-join-command' > /vagrant_data/join

echo "[2] Setup Completed"
