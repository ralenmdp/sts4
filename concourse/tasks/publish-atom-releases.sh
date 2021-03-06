#!/bin/bash
set -e
workdir=`pwd`

atom_packages=`ls -d atom-*`

for atom_package in $atom_packages
do
    echo "****************************************************************"
    echo "*** Publishing : ${atom_package}"
    echo "****************************************************************"
    cd $workdir/$atom_package
    tag=v$(cat package.json | jq -r ".version")
    export ATOM_ACCESS_TOKEN=$atom_token
    # apm login --token $atom_token
    apm publish --tag $tag
done
