#/bin/bash

echo "[1] k8s worker node - Joining to cluster"

bash /vagrant_data/join > /dev/null

echo "[2] Success . ssh kmaster1 to manage cluster"
