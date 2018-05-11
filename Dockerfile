FROM node:8-alpine as builder

ARG TAG=v1.3.15

RUN apk add --no-cache git python make

RUN git clone --branch $TAG --depth 1 https://github.com/YMFE/yapi.git /vendors \
    && cd /vendors \
    && sed -i -e 's/init\.lock/runtime\/init\.lock/' server/install.js \
    && npm install --production --registry https://registry.npm.taobao.org


FROM node:8-alpine
RUN apk add --no-cache tini

WORKDIR /app/vendors
EXPOSE 3000

COPY --from=builder /vendors /app/vendors
COPY ./entrypoint.sh /app/vendors/

ENTRYPOINT [ "/sbin/tini", "--" ]
CMD [ "/app/vendors/entrypoint.sh" ]
