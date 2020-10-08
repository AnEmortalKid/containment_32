FROM golang
RUN go get github.com/MagicTheGathering/mtg-sdk-go
COPY mt.go .
ENTRYPOINT ["go", "run", "mt.go"]
