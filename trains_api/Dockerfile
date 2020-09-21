FROM node:14

COPY package-lock.json .
COPY package.json .
COPY app.js . 
COPY pathfinder.js .

RUN npm i
ENTRYPOINT [ "node", "app.js" ]