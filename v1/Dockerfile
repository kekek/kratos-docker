FROM golang:1.16-alpine

RUN apk update && apk add protobuf-dev \
    && apk add  --no-cache git \
	&& apk add gcc

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

RUN go get -u github.com/go-kratos/kratos@v1.0.1 && go install  github.com/go-kratos/kratos/tool/kratos

RUN echo pwd

RUN ls /go/bin/

WORKDIR /go/src/app
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kratos", "-v"]
