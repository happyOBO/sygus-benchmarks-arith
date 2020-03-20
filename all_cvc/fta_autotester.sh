#!/bin/bash

# 실행 : nohup ./fta_autotester.sh & 

# test data : 82 / train data : 123 / total : 205
# target1=`ls /home/hgjo/euphony/benchmarks/string/test`
# target2=`ls /home/hgjo/euphony/benchmarks/string/train`

target_bit=`ls /home/hgjo/tester/white_sample2`
# 결과 저장 디렉토리 생성
# rm -r fta_result
# mkdir fta_result

# 데이터 병렬처리
# limit 1h

# 최대 병렬 처리 수
parallel="8"
count=1

# for data in $target1;
# do
#     p_count=`jobs -l|wc|awk '{print $1}'`
#     # 병렬처리 끝날때 까지 대기, 끝난 작업이 있으면 추가 실행
#     if [ $p_count -ge $parallel ]; then
#         until [ $p_count -lt $parallel ]
#         do
#             p_count=`jobs -l|wc|awk '{print $1}'`
#             sleep 1 
#         done
#     fi
#     # 실행
#     echo "start" $data "sample synthesis..."
#     # ./eusolvertester.sh ${data} "test" &
#     ./fta_tester.sh ${data} "test" &
#     echo $count data on testing
#     count=`expr $count + 1`
# done
# # 마지막 작업 대기
# last=`jobs -l|awk '{print $2}'`
# wait $last

# echo target2 start
# for data in $target2;
# do
#     p_count=`jobs -l|wc|awk '{print $1}'`
#     # 병렬처리 끝날때 까지 대기, 끝난 작업이 있으면 추가 실행
#     if [ $p_count -ge $parallel ]; then
#         until [ $p_count -lt $parallel ]
#         do
#             p_count=`jobs -l|wc|awk '{print $1}'`
#             sleep 1 
#         done
#     fi
#     # 실행
#     echo "start" $data "sample synthesis..."
#     # ./eusolvertester.sh ${data} "train" &
#     ./fta_tester.sh ${data} "train" &
#     echo $count data on testing
#     count=`expr $count + 1`
# done
# # 마지막 작업 대기
# last=`jobs -l|awk '{print $2}'`
# wait $last
# echo all Done.
rm -r fta_bit_result
mkdir fta_bit_result

for data in $target_bit;
do
    p_count=`jobs -l|wc|awk '{print $1}'`
    # 병렬처리 끝날때 까지 대기, 끝난 작업이 있으면 추가 실행
    if [ $p_count -ge $parallel ]; then
        until [ $p_count -lt $parallel ]
        do
            p_count=`jobs -l|wc|awk '{print $1}'`
            sleep 1 
        done
    fi
    # 실행
    echo "start" $data "sample synthesis..."
    # ./eusolvertester.sh ${data} "test" &
    ./fta_tester.sh ${data} &
    echo $count data on testing
    count=`expr $count + 1`
done
# 마지막 작업 대기
last=`jobs -l|awk '{print $2}'`
wait $last