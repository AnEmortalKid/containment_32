FROM adoptopenjdk/maven-openjdk11
COPY whisperer/ whisperer/
RUN mvn clean package -f whisperer
RUN cp whisperer/target/whisperer-1.0-SNAPSHOT.jar whisperer.jar
COPY whisperer/config.yml .
ENTRYPOINT ["java", "-jar", "whisperer.jar", "server", "config.yml"]
