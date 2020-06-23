# leonsec-ubuntu_lamp-docker
Suitable for ctf out-of-box lamp environment

# Usage 
## start
```
docker run -d --name=<container name> -p 8080:80 -p 8081:3306 leonsec/lamp:php5.5.9
```
Or you can mount a volume of the physical machine:
```
docker run -d --name=<container name> -p 8080:80 -p 8081:3306 -v /src:/app leonsec/lamp:php5.5.9
```

Or use `docker-compose` to deploy
docker-compose.yml:
```
version: "3"
services:
  web:
    build: .
    container_name: container name
    volumes:
      - ./src:/app
    restart: always
    ports:
      - "8080:80"
      #- "8081:3306"
    environment:
      - FLAG=flag{test_xxxxxx}
      #if $FLAG exist in flag.sh, delete here
```
## Custom application
* Dockerfile:

```
FROM leonsec/lamp:php5.5.9
LABEL maintainer="leon.clqorz@gmail.com"
RUN rm -rf /app/*
COPY src /app
COPY db.sql /db.sql
EXPOSE 80 3306
CMD ["/run.sh"]
```
* Then use `docker-compose` or `docker build` to build your image

## stop
```
docker stop <container name/container id>
docker rm <container name/container id>
```
## Tips
* Directory structure example：
```
├── db.sql
└── src
    ├── index.php
    ├── logo.png
    └── phpinfo.php


* The sql file is renamed to `db.sql` and placed under the current folder

* The php source code is placed in the `src` folder

* The image contains `flag.sh`in `/flag.sh`, the content is:


```
#!/bin/bash
mysqladmin -uroot password 'root'
mysql -e 'source /db.sql' -uroot -proot
service apache2 start
chown -R www-data:www-data /app
rm -f /db.sql
#flag
export FLAG=flag{test_xxxxx}
echo $FLAG > /flag
export FLAG=no
FLAG=no
rm -f /flag.sh

```

*  flag can be modified by yourself
* `flag.sh` needs to enter the container to manually execute `sh flag.sh` or not to enter the container to execute `docker exec -it <container id/container name> /bin/sh /flag.sh`

