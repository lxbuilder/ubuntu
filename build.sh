focalVer=$(cat Dockerfile | grep FROM | head -n1 |  awk '{ print $2 }' | rev | cut -c-14 | rev | tr -d '\r\n')

ARG1="20.04"
ARG2="latest"

docker build -t lxbuilder/ubuntu:${ARG1} -t lxbuilder/ubuntu:${ARG2} -t lxbuilder/ubuntu:${focalVer} .
docker push lxbuilder/ubuntu:${ARG1}
docker push lxbuilder/ubuntu:${ARG2}
docker push lxbuilder/ubuntu:${focalVer}