echo "Subindo web-server php"
docker service create --name web-app --replicas 15  --mount type=volume,src=app,dst=/app/ -dt -p 80:80 webdevops/php-apache:alpine-php7