FROM alpine:3.12

RUN apk --update add imagemagick libpng && \
    rm -rf /var/cache/apk/*

COPY backgrounds/ backgrounds/
COPY pokemon/ pokemon/
COPY create_frame.sh .
ENTRYPOINT ["sh", "create_frame.sh"]