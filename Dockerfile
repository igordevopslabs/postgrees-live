FROM golang:1.17 as builder

WORKDIR /app
COPY . /app

RUN CGO_ENABLED=1 GO111MODULES=on go build -ldflags="-s -w" .

FROM golang:1.17

WORKDIR /app
COPY --from=builder /app/postgrees-live /app

#ENTRYPOINT ["/app/postgrees-live", "source /vault/secrets/config"]