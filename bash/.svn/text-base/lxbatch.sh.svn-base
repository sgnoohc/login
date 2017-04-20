#!/bin/bash

#  .
# ..: philip chang, university of illinois at urbana-champaign

#--- batch job summary
function _showbjobs() {
  QUEUEFILTER=$1
  if [ -n "${QUEUEFILTER}" ]; then
	  bjobs -W | awk '{printf "%-10s %-6s %-6s %-10s %-15s %-10s %-10s %-16s %-30s\n", $1, $3, $4, $6, $10, $11, $12, $14, $7}' | grep ${QUEUEFILTER} | sort -g
	  NRUNJOBS=$(bjobs | grep RUN | grep ${QUEUEFILTER} | wc -l)
	  NPENDJOBS=$(bjobs | grep PEND | grep ${QUEUEFILTER} | wc -l)
	  NTOTALJOBS=$(echo $NRUNJOBS + $NPENDJOBS | bc)
  else
	  bjobs -W | awk '{printf "%-10s %-6s %-6s %-10s %-15s %-10s %-10s %-16s %-30s\n", $1, $3, $4, $6, $10, $11, $12, $14, $7}' | sort -g
	  NRUNJOBS=$(bjobs | grep RUN | wc -l)
	  NPENDJOBS=$(bjobs | grep PEND | wc -l)
	  NTOTALJOBS=$(echo $NRUNJOBS + $NPENDJOBS | bc)
  fi
	echo ""
	echo " == LXBATCH jobs summary =="
	echo "     TOTAL  : "$NTOTALJOBS
	echo "     RUN    : "$NRUNJOBS
	echo "     PEND   : "$NPENDJOBS
	echo ""
}

#--- batch job summary
function _exoshowbjobs() {
  QUEUEFILTER=$1
  if [ -n "${QUEUEFILTER}" ]; then
    bjobs -W | awk '{printf "%-6s %-30s %-5s\n", $3, $7, $8}'
	  NRUNJOBS=$(bjobs | grep RUN | grep ${QUEUEFILTER} | wc -l)
	  NPENDJOBS=$(bjobs | grep PEND | grep ${QUEUEFILTER} | wc -l)
	  NTOTALJOBS=$(echo $NRUNJOBS + $NPENDJOBS | bc)
  else
    bjobs -W | awk '{printf "%-6s %-30s %-5s\n", $3, $7, $8}'
	  NRUNJOBS=$(bjobs | grep RUN | wc -l)
	  NPENDJOBS=$(bjobs | grep PEND | wc -l)
	  NTOTALJOBS=$(echo $NRUNJOBS + $NPENDJOBS | bc)
  fi
	echo ""
	echo " == LXBATCH jobs summary =="
	echo "     TOTAL  : "$NTOTALJOBS
	echo "     RUN    : "$NRUNJOBS
	echo "     PEND   : "$NPENDJOBS
	echo ""
}

#--- done batch job summary
function _donebjobs() {
#  1     2    3    4     5         6         7        8           9         10       11  12   13   14         15
#  JOBID USER STAT QUEUE FROM_HOST EXEC_HOST JOB_NAME SUBMIT_TIME PROJ_NAME CPU_USED MEM SWAP PIDS START_TIME FINISH_TIME
  bjobs -W -d | awk '{printf "%-10s %-6s %-6s %-10s %-15s %-10s %-10s %-16s %-16s %-30s\n", $1, $3, $4, $6, $11, $12, $10, $14, $15, $7}' | tail -n10
}


#eof
