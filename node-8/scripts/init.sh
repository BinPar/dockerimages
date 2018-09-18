set -e

addgroup -g 1000 node \
  && adduser -u 1000 -G node -s /bin/sh -D node \
  && apk add --no-cache \
      libstdc++ \
  && apk add --no-cache --virtual .build-deps \
      binutils-gold \
      g++ \
      gcc \
      gnupg \
      libgcc \
      linux-headers \
      make

sh $TMP_DIR/install_node_8.sh
sh $TMP_DIR/cleanup.sh
