在本地创建一个一次性的Alpine Linux服务器
```
pnpm run play:alpine
```

## 基于Docker创建Laravel App

构建，生成`create-laravel-app-in-alpine:latest`镜像
```
pnpm run build:create-laravel-app-in-alpine
```

在项目目录，执行一次性容器，然后就会在项目目录的`src`子目录，创建一个新的`Laravel`项目，创建过程会有交互选项，选择创建参数。
```
docker run \
--interactive \
--tty \
--rm \
--volume $(pwd):/app create-laravel-app-in-alpine
```


创建vue应用
```
docker run \
--rm \
--volume $(pwd):/app create-vue-app-image
```