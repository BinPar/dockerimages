set -e

if [ ! -d /opt ]; then
  mkdir /opt
fi

sh $TMP_DIR/install_base.sh
sh $TMP_DIR/install_libs.sh
sh $TMP_DIR/cleanup.sh
