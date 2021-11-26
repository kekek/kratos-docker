FROM golang:1.16-alpine

RUN apk update && apk add protobuf-dev \
    && apk add  --no-cache git \
	&& apk add gcc

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

#RUN go get -u github.com/go-kratos/kratos@v1.0.1
RUN go get -u github.com/go-kratos/kratos/tool/kratos@v1.0.1

RUN /go/bin/kratos tool install protoc \
    && /go/bin/kratos tool install genbts \
    && /go/bin/kratos tool install genmc \
    && /go/bin/kratos tool install testgen \
    && /go/bin/kratos tool install testcli \
    && /go/bin/kratos tool install swagger

RUN ls /go/bin/ 
RUN ls /go/pkg/
RUN ls /go/src/

RUN echo pwd

RUN ls /go/bin/

WORKDIR /go/src/app
COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["kratos", "-v"]
