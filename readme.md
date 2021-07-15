## kratos 

go kratos框架工具命令kratos

## 镜像主要工具 
- go1.16.5
- protoc 3.13.0
- kratos v2.0.0-rc3 
- git 2.30.2

## 常用命令示例

-  kratos 生成新项目 kratos-daemon

```bash 
kratos new kratos-daemon
```

```bash 
docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  --name test-kratos kekek/kratos:v1 kratos new kratos-daemon
```

- 安装

切换到项目工作目录 kratos-daemon

```
go generate ./...
```

```
cd {kratos-daemon}

docker run -it --rm --dns "114.114.114.114" -v $(pwd):/go/src/app/  --name  test-kratos kekek/kratos:v1 go generate -v ./...
```

- go build 

```bash 
docker run -it --rm  -v $(pwd):/go/src/app/ --name test-kratos kekek/kratos:v1 go build -o ./bin ./...
```

- run 

```bash 
docker run -it --rm  -v $(pwd):/go/src/app/ --name test-kratos kekek/kratos:v1 go build -o ./bin ./...
```
