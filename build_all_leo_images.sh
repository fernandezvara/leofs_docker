#!/bin/bash

if [ $# -eq 0 ]
then
  echo "No tag passed."
fi

TAG=$1
IMAGES=( debian78_leofs_builder leofs_gateway leofs_manager_master leofs_manager_slave leofs_storage )

for IMG in "${IMAGES[@]}"
do
   cd $IMG
   docker build -t $IMG:$TAG .
   docker push $IMG:$TAG
   cd ..
done
