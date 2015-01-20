task=$1
numservers=$2
numqueries=$3
gpuid=$4

BASE_PORT=$(( 7999 + $gpuid*100 ))

export glog_logtostderr=4
export glog_log_dir=`pwd`/log

for i in $(seq 1 $numservers);
do
    ./run-img.sh $1 $((BASE_PORT + $i)) $3 &
done

wait