# Etapa de compilação
FROM golang:1.16 AS builder

COPY . /app
WORKDIR /app

RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o go-docker

FROM scratch

COPY --from=builder /app/go-docker /go-docker

CMD ["/go-docker"]

