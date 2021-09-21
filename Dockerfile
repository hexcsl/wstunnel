FROM quay.io/bitnami/node:latest as build
COPY . /wstunnel
RUN cd /wstunnel && npm install --production

FROM quay.io/jitesoft/alpine:latest
COPY --from=build /wstunnel /wstunnel
WORKDIR /wstunnel
ENTRYPOINT ["node", "/wstunnel/bin/wstt.js"]
