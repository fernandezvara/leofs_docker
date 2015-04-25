#!/bin/bash

if [ $# -eq 0 ]
then
  echo "No tag passed."
  exit 1
fi

TAG=$1
IMAGES=( debian78_leofs_builder leofs_gateway leofs_manager_master leofs_manager_slave leofs_storage )

for IMG in "${IMAGES[@]}"
do
   cd $IMG
   docker build -t devopsbq/$IMG:$TAG .
   docker push devopsbq/$IMG:$TAG
   cd ..
done
