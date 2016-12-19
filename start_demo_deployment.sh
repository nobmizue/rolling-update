#!/bin/bash
#
# Deployement 
#
cmd="kubectl create -f poke1-deploy.yaml"
echo "### create container"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd

cmd="kubectl scale --replicas=5 deployment/update-demo-poke1"
echo "### scale out to 5"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd

cmd="kubectl scale --replicas=10 deployment/update-demo-poke1"
echo "### scale out to 10"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd

cmd="kubectl scale --replicas=3 deployment/update-demo-poke1"
echo "### scale in to 3"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd

kubectl rollout status deployment/update-demo-poke1
cmd="kubectl set image deployment/update-demo-poke1 update-demo=gcr.io/mizueproject/update-demo:poke2"
echo "### update image"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd

cmd="kubectl delete deployment update-demo-poke1"
echo "### delete contaiers"
echo $cmd
/bin/echo -n "Hit any key: "
read key
$cmd
