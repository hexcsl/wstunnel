FROM quay.io/bitnami/node:latest as build
COPY . /wstunnel
RUN cd /wstunnel && npm install --production

FROM quay.io/jitesoft/alpine:latest
RUN apk add --update-cache nodejs openssh-client curl redsocks-0.5-r2
COPY --from=build /wstunnel /wstunnel
WORKDIR /wstunnel
ENTRYPOINT ["node", "/wstunnel/bin/wstt.js"]
