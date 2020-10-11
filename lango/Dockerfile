FROM mhndev/docker-lua

ARG LANGUAGELAYER_KEY
ENV API_KEY=${LANGUAGELAYER_KEY}

RUN luarocks install httpclient
RUN luarocks install lunajson

COPY lango.lua .
ENTRYPOINT ["lua", "lango.lua"]