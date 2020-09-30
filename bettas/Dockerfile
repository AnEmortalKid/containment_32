FROM typelead/eta

COPY Main.hs .
RUN etlas exec eta -- Main.hs
ENTRYPOINT ["java", "-jar", "RunMain.jar"]