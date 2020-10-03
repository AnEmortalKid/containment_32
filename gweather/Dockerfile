FROM groovy:3.0-jdk11

ARG WEATHERSTACK_KEY
ENV API_KEY=${WEATHERSTACK_KEY}

USER root
RUN mkdir -p /gweather/libs/
WORKDIR /gweather
RUN wget https://repo1.maven.org/maven2/org/json/json/20200518/json-20200518.jar -P libs/
RUN wget https://repo1.maven.org/maven2/com/vdurmont/emoji-java/5.1.1/emoji-java-5.1.1.jar -P libs/

COPY wwoConditionCodes.xml /gweather
COPY gweather.groovy /gweather
USER groovy
ENTRYPOINT [ "groovy", "-cp", ".:/gweather/libs/*", "gweather.groovy" ]