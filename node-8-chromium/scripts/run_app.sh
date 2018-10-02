set -e

if [ -d /bundle ]; then
  cd /bundle
  npm install --production
  export IS_PROD=1
  npm start
else
  echo "=> You don't have a node app to run in this image."
  exit 1
fi
