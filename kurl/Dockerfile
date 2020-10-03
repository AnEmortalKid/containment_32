FROM zenika/alpine-kotlin
COPY kurl.kt .
RUN kotlinc kurl.kt -include-runtime -d kurl.jar
ENTRYPOINT ["java", "-jar", "kurl.jar"]