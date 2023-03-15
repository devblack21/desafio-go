FROM golang:alpine as alpine

WORKDIR /go/src/app

ADD ./code/script.go .

RUN CGO_ENABLED=0 go build -o /app script.go

FROM scratch as scratch

COPY --from=alpine /app /app

ENTRYPOINT ["/app"]