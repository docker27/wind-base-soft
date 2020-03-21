docker rm -f basesoft
docker rmi qianchun27/basesoft:1
docker build -t qianchun27/basesoft:1 -f Dockerfile .
docker run --privileged -t -d -p 80:80 -p 8081:8081 -p 8082:8082 --name basesoft qianchun27/basesoft:1 /usr/sbin/init;
docker network connect wind_net basesoft
docker exec -it basesoft /bin/bash
