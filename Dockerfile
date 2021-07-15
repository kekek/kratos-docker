FROM golang:1.16-alpine

RUN apk update && apk add --no-cache protobuf \
    && apk add  --no-cache git
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

RUN go get github.com/go-kratos/kratos/cmd/kratos/v2@latest && kratos upgrade

WORKDIR /go/src/app
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kratos", "-v"]
