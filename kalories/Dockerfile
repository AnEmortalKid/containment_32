FROM zenika/alpine-kotlin

COPY *.kt /app/

WORKDIR /app
RUN mkdir -p /app/libs/
RUN wget https://repo1.maven.org/maven2/org/json/json/20200518/json-20200518.jar -P libs/

RUN kotlinc *.kt -include-runtime -d kalories.jar -cp /app/libs/*

ENTRYPOINT [ "java", "-cp", "/app/kalories.jar:/app/libs/*", "KaloriesKt" ]
