

dir=$1

if [[ $dir == '' ]];then
    dir=oss://jindi-data-flink/logs/data-etl-default-default/a8136709-edd7-4f7d-8ad3-1f63b2e78c6c/c8d4ce73-68f7-467d-9722-da4b26974c28/
fi

oss=ossutilmac64

tmp_dir=/tmp/down_oss_dir.txt.tmp
$oss ls $dir | awk '{ print $8 }' > $tmp_dir

for uri in `cat $tmp_dir`;
do 
    echo $uri
    $oss cp $uri `basename $uri` 
done
