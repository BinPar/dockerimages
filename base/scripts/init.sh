set -e

if [ ! -d /opt ]; then
  mkdir -p /opt
fi

sh $TMP_DIR/install_base.sh
sh $TMP_DIR/cleanup.sh
