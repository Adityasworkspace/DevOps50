Docker mount

docker volume ls #list volume
docker volume create vol-1

docker run -itd --name my-count --mount source=vol-1,target=/mnt ubuntu
 docker ps 
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker run -itd --name cont-1 --mount source=vol-1,target=/mnt ubuntu

docker stats
docker exec -it cont-1 /bin/bash
cd mnt
ls
touch optimus.txt megatron.txt
ls
exit
docker ps
removed the container

CREATING NEW CONTAINER

docker run -itd --name new-cont --mount source=vol-1,target=/devops50

docker volume inspect vol1 (to view the details of volume inspect)
LOGGING IN THE CONTAINER
docker exec -it new-cont /bin/bash
docker volume --help
docker volume create ebs
docker volume ls
docker run
docker run -itd --name server -v ebs:/cloudblitz ubuntu


remove volume steps

docker stop$(docker ps -aq)
docker rm $(docker ps-aq)
docker volume rm vol-1
docker volume rm ebs
