#!/bin/sh

if [ ! -e "/app/runtime/init.lock" ]; then
  echo "============================="
  echo "Install server after 10s....."
  echo "============================="

  sleep 10s

  echo "============================="
  echo "Installing server ..........."
  echo "============================="
  npm run install-server
fi;

node /app/vendors/server/app.js
