#!/bin/sh

if [ ! -e "/app/runtime/init.lock" ]; then
  echo "========================"
  echo "Installing server ......"
  echo "========================"
  npm run install-server
fi;

node /app/vendors/server/app.js
