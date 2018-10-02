set -e

if [ -d /bundle ]; then
  cd /bundle
  npm install --production
else
  echo "=> You don't have a node app to run in this image."
  exit 1
fi

# Set a delay to wait to start meteor container
#echo "Delaying startup for 2 seconds"
#sleep 1

# Honour already existing PORT setup
# Node no necesita especificar puerto
# export PORT=${PORT:-80}

# echo "=> Starting node app on port:$PORT"
pwd
echo "=> Starting node npm start ..."
export IS_PROD=1
export DISPLAY=:9.0
xvfb-run --server-args "-screen 0 1920x1080x24" npm start
