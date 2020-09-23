FROM node:14

COPY map/ /app/
WORKDIR /app/

RUN npm i
RUN npm i -g serve
RUN npm run build
ENTRYPOINT [ "serve", "-s", "build" ]