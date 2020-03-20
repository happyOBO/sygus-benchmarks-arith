#!/bin/bash

# input  $1 $2

result_dir="fta_bit_result"
time1=`date +%s`
# timeout 1h ./bin/run_bitvec_eusolver [.sl]
timeout 1h /home/wslee/project/fta_synthesis/main.native /home/hgjo/tester/white_sample2/$1 >> $result_dir/$1_fta_result.txt 2>> $result_dir/$1_fta_result.txt 
time2=`date +%s`
diff=`echo "$time2-$time1" | bc`
mtime=`echo "(${diff}/60)" | bc`
stime=`echo "(${diff}-(${mtime}*60))" | bc`
echo "$1 running time : ${mtime} m ${stime} s" >> $result_dir/$1_fta_result.txt
echo "times : ${diff}" >> $result_dir/$1_fta_result.txt
echo "running time : ${mtime} m ${stime} s"  $1

# timeout 5m /home/wslee/project/fta_synthesis/main.native exceljet1.sl >> fta_result.txt
# timeout 5m /home/wslee/project/fta_synthesis/main.native /white_sample2/white-cbba-0.sl