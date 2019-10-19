#/bin/bash

echo "[1] k8s worker node - Joining to cluster"

bash /vagrant_data/join > /dev/null

echo "[2] Success . ssh km1 to manage cluster"
