FROM node:14-alpine

RUN apk add git

WORKDIR /code
RUN git clone https://github.com/dogescript/dogescript

WORKDIR /code/dogescript
# checkout the detached commit where the binary is fixed
RUN git checkout 5b6c769620c8ff88b5076a2137f29016a1be1645

RUN npm install
RUN npm run build
RUN npm link .

# cerner_2^5_2020
ENTRYPOINT ["dogescript"]
