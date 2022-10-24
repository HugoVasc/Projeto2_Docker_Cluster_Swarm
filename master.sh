#!/bin/bash
echo "Inciando cluster..."
docker swarm init --advertise-addr=10.0.0.200
docker swarm join-token worker | grep docker > /vagrant/worker.sh
echo "Criando  volumes de dados..."
docker volume create app
docker volume create data
echo "Instalando servidor NFS..."
apt-get install nfs-server -y
echo "Copiando dados..."
cp -r /vagrant/data/* /var/lib/docker/volumes/data/_data/
cp /vagrant/index.php /var/lib/docker/volumes/app/_data
echo "/var/lib/docker/volumes/app/_data" >> /etc/exports
exportfs -ar
echo "Iniciando banco de dados..."
docker run -dti -e MYSQL_ROOT_PASSWORD=Senha123 -e MYSQL_DATABASE=meubanco -p 3306:3306 --mount type=volume,src=data,dst=/var/lib/mysql mysql:5.7
docker node update --availability drain master