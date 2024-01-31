# Домашнее задание 13. Docker

## Задание

1. Установите Docker на хост машину

[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

1. Установите Docker Compose - как плагин, или как отдельное приложение
2. Создайте свой кастомный образ nginx на базе alpine. После запуска nginx должен отдавать кастомную страницу (достаточно изменить дефолтную страницу nginx)
3. Определите разницу между контейнером и образом
4. Вывод опишите в домашнем задании.
5. Ответьте на вопрос: Можно ли в контейнере собрать ядро?

Собранный образ необходимо запушить в docker hub и дать ссылку на ваш репозиторий.

# Решение

### Установка ПО

[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

```jsx
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

```jsx
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Создаем директорию с проектом

Создаем файлы 

Dockerfile:

```bash
FROM alpine
RUN apk add --update nginx
COPY index.html /usr/share/nginx/html/index.html
COPY default.conf /etc/nginx/http.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

default.conf:

```bash
server {
        listen 80 default_server;
        root /usr/share/nginx/html/;
        index index.html;
}
```

index.html:

```html
<!DOCTYPE html>
<html>
<head>
<title>Hello World!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Hello OTUS from VAD Otus!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

**Создаём образ из файла конфигурации и запускаем docker-контейнер**

```bash
docker build -t vad1mb/otusnginx .
[+] Building 6.2s (9/9) FINISHED                                                                                     docker:default
 => [internal] load build definition from Dockerfile                                                                           0.0s
 => => transferring dockerfile: 222B                                                                                           0.0s
 => [internal] load metadata for docker.io/library/alpine:latest                                                               0.7s
 => [internal] load .dockerignore                                                                                              0.0s
 => => transferring context: 2B                                                                                                0.0s
 => [1/4] FROM docker.io/library/alpine:latest@sha256:51b67269f354137895d43f3b3d810bfacd3945438e94dc5ac55fdac340352f48         1.7s
 => => resolve docker.io/library/alpine:latest@sha256:51b67269f354137895d43f3b3d810bfacd3945438e94dc5ac55fdac340352f48         0.1s
 => => sha256:51b67269f354137895d43f3b3d810bfacd3945438e94dc5ac55fdac340352f48 1.64kB / 1.64kB                                 0.0s
 => => sha256:13b7e62e8df80264dbb747995705a986aa530415763a6c58f84a3ca8af9a5bcd 528B / 528B                                     0.0s
 => => sha256:f8c20f8bbcb684055b4fea470fdd169c86e87786940b3262335b12ec3adef418 1.47kB / 1.47kB                                 0.0s
 => => sha256:661ff4d9561e3fd050929ee5097067c34bafc523ee60f5294a37fd08056a73ca 3.41MB / 3.41MB                                 1.1s
 => => extracting sha256:661ff4d9561e3fd050929ee5097067c34bafc523ee60f5294a37fd08056a73ca                                      0.4s
 => [internal] load build context                                                                                              0.0s
 => => transferring context: 178B                                                                                              0.0s
 => [2/4] RUN apk add --update nginx                                                                                           3.0s
 => [3/4] COPY index.html /usr/share/nginx/html/index.html                                                                     0.1s
 => [4/4] COPY default.conf /etc/nginx/http.d/default.conf                                                                     0.2s
 => exporting to image                                                                                                         0.3s
 => => exporting layers                                                                                                        0.2s
 => => writing image sha256:cb76568606ba2ce9833fe646c74329f97b91e890aee9556c22595d0a149bf2ad                                   0.0s
 => => naming to docker.io/vad1mb/otusnginx                                                                                    0.0s    

# Запускаем контейнер
docker run -dt -p80:80 --name otus-nginx vad1mb/otusnginx
5e1d0c9b27ba4281b65608b447920ff7a4c9e5c5db20e16ba385e0a4ad08cd66

# Смотрим статус контейнеров
docker ps
CONTAINER ID   IMAGE              COMMAND                  CREATED          STATUS          PORTS                               NAMES
5e1d0c9b27ba   vad1mb/otusnginx   "nginx -g 'daemon of…"   37 seconds ago   Up 35 seconds   0.0.0.0:80->80/tcp, :::80->80/tcp   otus-nginx

# Заходим в контейнер 
docker exec -it 5e1d0 /bin/sh
/ # hostname
5e1d0c9b27ba
```

Выходим из контейнера Ctrl+d

Проверяем открытие странички с хоста

```html
curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Hello World!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Hello OTUS from VAD Otus!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```

**Hello OTUS from VAD Otus!**
