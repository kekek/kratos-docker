## kratos 

go kratos框架工具命令kratos V2

## 镜像主要工具 
- go1.16.5
- protoc 3.13.0
- kratos v2.0.0
- git 2.30.2


## 首先本地构建一个docker镜像

docker build -t kratos:v2 .

## 常用命令示例

-  kratos 生成新项目 helloworld

```bash 
kratos new helloworld
```

```bash 
docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  -w ./ --name test-kratos kratos:v2 kratos new helloworld
```

> `切换进入宿主机项目目录 ：helloworld， 执行之后的命令`


- 安装

```
docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  --name  test-kratos kratos:v2 go mod vendor 
```

- go build 

```bash 
docker run -it --rm  -v $(pwd):/go/src/app/ --name test-kratos kratos:v2 go build -mod=vendor -o ./bin/  cmd/helloworld/
```

- run 

```bash 
docker run -it  --dns "114.114.114.114" --rm -v $(pwd):/go/src/app  kratos:v2 go run -mod=vendor  ./cmd/helloworld/ -conf ./configs
```

- 生成proto模板

生成 test.proto 文件

```
// kratos proto add api/test/test.proto

docker run -it --rm -v $(pwd):/go/src/app kratos:v2 kratos proto add api/test/test.proto

```

- 生成 proto 源码

```
 kratos proto client api/test/test.proto

 docker run -it --rm -v $(pwd):/go/src/app kratos:v2 kratos proto client api/test/test.proto

```

执行此条命令后，会报一个错误` directory does not exist`, 此时应该 重新 执行`go mod vendor`
```
/go/pkg/mod/github.com/go-kratos/kratos/v2@v2.0.0: warning: directory does not exist.
/go/pkg/mod/github.com/go-kratos/kratos/v2@v2.0.0/third_party: warning: directory does not exist.
```

- 生成server模板

```
kratos proto server api/test/test.proto -t internal/service


docker run -it --rm -v $(pwd):/go/src/app kratos:v2 kratos proto server api/test/test.proto -t internal/service

```