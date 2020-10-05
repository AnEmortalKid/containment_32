FROM dlanguage/dmd

COPY roll.d .
RUN dmd roll.d
ENTRYPOINT ["./roll"]