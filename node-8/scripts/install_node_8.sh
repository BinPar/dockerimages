#!/bin/sh

NODE_VERSION=v8.12.0
if [ -n "$MUPX_NODE_VERSION" ]; then
  NODE_VERSION=v${MUPX_NODE_VERSION}
else
  NODE_VERSION=$(curl -s http://nodejs.org/dist/latest-v8.x/ | grep -o '<a .*href=.*>' | sed -e 's/<a /\<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | grep 'linux' | grep "x64" | grep ".tar.gz" | sed -e 's/node-//g' -e 's/-linux-x64.tar.gz//g')
fi
# gpg keys listed at https://github.com/nodejs/node#release-team
for key in \
  94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
  FD3A5288F042B6850C66B31F09FE44734EB7990E \
  71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
  DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
  C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
  B9AE9905FFD7803F25714661B63B535A4C206CA9 \
  56730D5401028683275BD23C23EFEFE93C4CFFFE \
  77984A986EBC2AA786BC0F66B01FBB92821C587A \
  8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
; do \
  gpg --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
  gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
  gpg --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
done
curl -fsSLO --compressed "https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION.tar.xz"
curl -fsSLO --compressed "https://nodejs.org/dist/$NODE_VERSION/SHASUMS256.txt.asc"
gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc
grep " node-$NODE_VERSION.tar.xz\$" SHASUMS256.txt | sha256sum -c -
tar -xf "node-$NODE_VERSION.tar.xz"
cd "node-$NODE_VERSION"
./configure
make -j$(getconf _NPROCESSORS_ONLN)
make install
apk del .build-deps
cd ..
rm -Rf "node-$NODE_VERSION"
rm "node-$NODE_VERSION.tar.xz" SHASUMS256.txt.asc SHASUMS256.txt
