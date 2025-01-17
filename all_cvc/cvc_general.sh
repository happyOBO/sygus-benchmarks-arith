#!/bin/bash

cvc4=/home/wslee/utils/CVC4/cvc4
bench="$1"

function runl {
  limit=$1; shift;
  ulimit -S -t "$limit";$cvc4 --lang=sygus --no-checking --no-interactive --dump-synth --default-dag-thresh=0 "$@" $bench
}

function trywith {
  sol=$(runl $@)
  status=$?
  if [ $status -ne 134 ]; then
    echo $sol | read result w1;
    if [ ${PIPESTATUS[1]} -eq 0 ]; then exit 0; fi  
  fi
}

function finishwith {
  $cvc4 --lang=sygus --no-checking --no-interactive --dump-synth --default-dag-thresh=0 "$@" $bench 2>/dev/null |
  (read result w1;
  case "$result" in
  unsat) echo "$w1";cat;exit 0;;
  esac)
}

trywith 120 --cegqi-si=all-abort --cegqi-si-abort --decision=internal --cbqi-prereg-inst
finishwith --cegqi-si=none
