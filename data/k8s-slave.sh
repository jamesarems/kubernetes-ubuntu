#/bin/bash
SYSIP=`ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 3p`

echo "[1] k8s worker node - Joining to cluster"

bash /vagrant_data/join > /dev/null
sudo sed -i "s/--network-plugin=cni/--network-plugin=cni --node-ip=$SYSIP/g" /var/lib/kubelet/kubeadm-flags.env
sudo systemctl restart kubelet

echo "[2] Success . ssh km1 to manage cluster"
