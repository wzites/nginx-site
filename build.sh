#

# build docker image ...
# read also https://medium.com/@kelseyhightower/12-fractured-apps-1080c73d481c
IMAGE=nginx-site
CONTAINER=nginx-site

if docker ps -f name=$CONTAINER | grep -q -w $CONTAINER; then
   docker stop $CONTAINER
fi
if docker ps -a -f name=$CONTAINER | grep -q -w $CONTAINER; then
  echo "docker: rm $CONTAINER"
  docker rm $CONTAINER
fi

find . -name '*~1' -delete
docker image rm $IMAGE
docker build -t $IMAGE .
docker images -f reference=$IMAGE

docker run -it --rm -d --name $CONTAINER $IMAGE
docker ps -f name=$CONTAINER
docker logs $CONTAINER
