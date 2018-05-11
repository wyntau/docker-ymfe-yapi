#!/bin/sh

echo $1;

if [ "$1" = "init" ]; then
  npm run install-server
fi;

/sbin/tini -- node server/app.js