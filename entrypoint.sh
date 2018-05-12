#!/bin/sh

if [ ! -e "/app/runtime/init.lock" ]; then
  echo "========================"
  echo "Installing server ......"
  echo "========================"
  sleep 6s
  npm run install-server
fi;

node /app/vendors/server/app.js
