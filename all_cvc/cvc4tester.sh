#!/bin/bash

# input  $1 ($2)

result_dir="cvc_int_result"
time1=`date +%s.%N`
# timeout 1h ./bin/run_bitvec_eusolver [.sl]
timeout 600 /home/wslee/utils/CVC4/cvc4 --lang=sygus --no-checking --no-interactive --dump-synth --default-dag-thresh=0 /home/obo/cvc/cvc_intrun/$1 >> $result_dir/$1_cvc4_result.txt
time2=`date +%s.%N`
diff=`echo "$time2-$time1" | bc`
mtime=`echo "(${diff}/60)" | bc`
stime=`echo "(${diff}-(${mtime}*60))" | bc`
echo "$1 running time : ${mtime} m ${stime} s" >> $result_dir/$1_cvc4_result.txt
echo "times : ${diff}" >> $result_dir/$1_cvc4_result.txt
echo "running time : ${mtime} m ${stime} s"  $1

#/home/wslee/CVC4/starexec_run_sygus_c_PBE_Strings
# timeout 5m /home/wslee/utils/CVC4/starexec_run_sygus_c_PBE_Strings exceljet1.sl >> cvc_result.txt 2>> cvc_result.txt
# timeout 5m ./cvc_string.sh exceljet1.sl >> cvc_result.txt 2>> cvc_result.txt
# timeout 5m /home/wslee/project/fta_synthesis/main.native exceljet1.sl >> fta_result.txt
