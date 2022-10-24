echo "Instalando NFS Client"
docker volume create app
apt-get install nfs-common -y && mount 10.0.0.200:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data