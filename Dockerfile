FROM node:8-alpine

WORKDIR /app

RUN apk add --no-cache git tini
RUN git clone --depth 1 https://github.com/YMFE/yapi.git vendors \
    && npm install --production --registry http://r.npm.sankuai.com \
    && npm run install-server

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["node", "/app/vendors/server/app.js"]
