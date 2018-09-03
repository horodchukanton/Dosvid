#!bash

PLACKUP_PORT=3000

if [ $PORT ]; then
  PLACKUP_PORT=$PORT
fi

cd /usr/Dosvid

plackup -R . --port ${PLACKUP_PORT} bin/app.pl
