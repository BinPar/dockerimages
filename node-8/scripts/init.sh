set -e

bash $TMP_DIR/install_base.sh
bash $TMP_DIR/install_libs.sh
bash $TMP_DIR/install_node_8.sh
bash $TMP_DIR/cleanup.sh
