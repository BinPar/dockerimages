set -e

if [ -d /bundle ]; then
  cd /bundle
  npm install --production
else
  echo "=> You don't have a node app to run in this image."
  exit 1
fi

pwd
export PORT=80
npm run start
