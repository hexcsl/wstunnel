FROM node:current-buster as build
COPY . /wstunnel
RUN cd /wstunnel && npm install --production

FROM node:current-alpine
COPY --from=build /wstunnel /wstunnel
WORKDIR /wstunnel
ENTRYPOINT ["node", "/wstunnel/bin/wstt.js"]
