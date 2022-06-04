FROM golang:1.18.3-alpine3.16 AS builder

WORKDIR /go-workspace

COPY . .

RUN go build hello-world.go

FROM scratch

WORKDIR /go-run

COPY --from=builder /go-workspace .

ENTRYPOINT ["./hello-world"]
