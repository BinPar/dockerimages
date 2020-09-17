LINK_NODE10=http://nodejs.org/dist/latest-v10.x/
DOWNLOAD_NODE10=$(curl -L -s $LINK_NODE10 | grep -o '<a .*href=.*>' | sed -e 's/<a /<a /g' | sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' | grep 'linux' | grep "x64" | grep ".tar.gz")
LINK_NODE10=$LINK_NODE10$DOWNLOAD_NODE10
curl -O -L $LINK_NODE10
DIR_NODE10=$(echo $DOWNLOAD_NODE10 | sed -e 's/.tar.gz//')
tar xvzf $DOWNLOAD_NODE10
mv $DIR_NODE10 /opt/nodejs
ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm
ln -sf /opt/nodejs/bin/npx /usr/bin/npx