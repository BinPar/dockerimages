set -e

bash $TMP_DIR/install_cfssl.sh
bash $TMP_DIR/install_kubectl.sh
bash $TMP_DIR/cleanup.sh
