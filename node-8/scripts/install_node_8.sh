#!/bin/sh
set -e

cd $TMP_DIR

if [ -n "$MUPX_NODE_VERSION" ]; then
  NODE_VERSION=${MUPX_NODE_VERSION}
  NODE_DIST=node-v${NODE_VERSION}-linux-x64
  curl -O -L http://nodejs.org/dist/v${NODE_VERSION}/${NODE_DIST}.tar.gz
  tar xvzf ${NODE_DIST}.tar.gz
  rm -rf /opt/nodejs
  mv ${NODE_DIST} /opt/nodejs
else
  LINK_NODE8=http://nodejs.org/dist/latest-v8.x/
  DOWNLOAD_NODE8=$(curl -s $LINK_NODE8 | grep -o '<a .*href=.*>' | sed -e 's/<a /\<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | grep 'linux' | grep "x64" | grep ".tar.gz")
  LINK_NODE8=$LINK_NODE8$DOWNLOAD_NODE8
  curl -O -L $LINK_NODE8
  tar xvzf $DOWNLOAD_NODE8
  DIR_NODE8=$(echo $DOWNLOAD_NODE8 | sed -e 's/.tar.gz//')
  rm -rf /opt/nodejs
  mv $DIR_NODE8 /opt/nodejs
fi

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm