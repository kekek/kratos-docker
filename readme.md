## kratos 

go kratos框架工具命令kratos V2

## 镜像主要工具 
- go1.16.5
- protoc 3.13.0
- kratos v2.0.0
- git 2.30.2


## 首先本地构建一个docker镜像

docker build -t kratos .

## 常用命令示例

-  kratos 生成新项目 helloworld

```bash 
kratos new helloworld
```

```bash 
docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  -w ./ --name test-kratos kratos kratos new helloworld
```

> `切换进入宿主机项目目录 ：helloworld， 执行之后的命令`


- 安装

```
docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  --name  test-kratos kratos go mod vendor 
```

- go build 

```bash 
docker run -it --rm  -v $(pwd):/go/src/app/ --name test-kratos kratos go build -mod=vendor -o ./bin/  cmd/helloworld/
```

- run 

```bash 
docker run -it  --dns "114.114.114.114" --rm -v $(pwd):/go/src/app  kratos go run -mod=vendor  ./cmd/helloworld/ -conf ./configs
```

- 生成proto模板

生成 test.proto 文件

```
// kratos proto add api/test/test.proto

docker run -it --rm -v $(pwd):/go/src/app kratos kratos proto add api/test/test.proto

```

- 生成 proto 源码

```
 kratos proto client api/test/test.proto

 docker run -it --rm -v $(pwd):/go/src/app kratos kratos proto client api/test/test.proto

```

- 生成server模板

```
kratos proto server api/test/test.proto -t internal/service


docker run -it --rm -v $(pwd):/go/src/app kratos kratos proto server api/test/test.proto -t internal/service

```


- swagger 生成 

 首先在Dockerfile 中添加新指令， 重新构建镜像 

```
 RUN go get -u github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2

```
 
然后， 在docker中运行下面的命令
```
protoc --proto_path=. \
        --proto_path=./third_party \
        --openapiv2_out . \
        --openapiv2_opt logtostderr=true \
        --openapiv2_opt json_names_for_fields=false \
        api/test/test.proto

```



- fix 

`google/protobuf/descriptor.proto: File not found.` 出现这个错误是因为apk add protobuf 自带的引用包没有 这些文件， 使用 protobuf-dev 
