echo "###############################"
echo "starting container POKE1"
echo "###############################"
cmd="kubectl create -f poke1-rc.yaml"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

echo "#############################"
echo "start scaling up to 5" 
echo "#############################"
cmd="kubectl scale rc update-demo-poke1 --replicas=5"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

echo "#############################"
echo "start scaling up to 20" 
echo "#############################"
cmd="kubectl scale rc update-demo-poke1 --replicas=20"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

echo "###############################"
echo "start scaling down to 3" 
echo "###############################"
cmd="kubectl scale rc update-demo-poke1 --replicas=3"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

echo "###############################"
echo "start Rolling update to POKE2" 
echo "###############################"
cmd="kubectl rolling-update update-demo-poke1 --update-period=2s -f poke2-rc.yaml"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

echo "###############################"
echo "delete containers"
echo "###############################"
cmd="kubectl delete -f poke2-rc.yaml"
echo $cmd
/bin/echo -n "Hit return key > "
read input
$cmd

