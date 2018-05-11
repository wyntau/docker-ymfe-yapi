FROM node:8-alpine as builder

RUN apk add --no-cache git tini python make

RUN git clone --depth 1 https://github.com/YMFE/yapi.git /vendors \
    && cd /vendors \
    && npm install --production --registry https://registry.npm.taobao.org


FROM node:8-alpine
RUN apk add --no-cache tini

WORKDIR /app/vendors
EXPOSE 3000

COPY --from=builder /vendors /app/vendors

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["npm", "run", "install-server", "&& node", "server/app.js"]