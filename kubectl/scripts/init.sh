set -e

sh $TMP_DIR/install_cfssl.sh
sh $TMP_DIR/install_kubectl.sh
sh $TMP_DIR/cleanup.sh
