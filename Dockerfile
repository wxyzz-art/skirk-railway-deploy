FROM golang:1.23-alpine AS build
RUN apk add --no-cache git
WORKDIR /src
RUN git clone --depth 1 https://github.com/ShahabSL/Skirk.git .
RUN CGO_ENABLED=0 go build -o /out/skirk ./cmd/skirk

FROM alpine:3.20
RUN apk add --no-cache ca-certificates
COPY --from=build /out/skirk /usr/local/bin/skirk
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
VOLUME /data
ENTRYPOINT ["/entrypoint.sh"]
