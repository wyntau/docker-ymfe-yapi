FROM node:8-alpine

RUN apk add --no-cache git tini python

WORKDIR /app

RUN mkdir -p /app && git clone --depth 1 https://github.com/YMFE/yapi.git /app/vendors \
    && cd /app/vendors \
    && npm install --production --registry https://registry.npm.taobao.org

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["npm", "run", "install-server", "&& node", "/app/vendors/server/app.js"]
