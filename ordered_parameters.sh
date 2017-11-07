#!/bin/bash

#$ -V
#$ -cwd

# Tell the SGE that this is an array job, with "tasks" to be numbered 1 to 46
#$ -t 1-46 -tc 20

## two minutes should be plenty for each task
#$ -l h_rt=00:02:00

#$ -N taskarray

#$ -o job_output/$JOB_NAME-$JOB_ID-$TASK_ID

TASK_NUMBERS=(3 14 30 31 50 50 51 52 56 63 70 79 79 80 80 83 86 96 99)

# if we've gone beyond just return
if [ ${#TASK_NUMBERS[@]} -le "${SGE_TASK_ID}" ] ; then
  echo "task ${SGE_TASK_ID} ignored as it is greater than the number of tasks left ${#TASK_NUMBERS[@]}"
  exit
fi

echo "doing task ${SGE_TASK_ID} ${TASK_NUMBERS[${SGE_TASK_ID}]}"

module add apps/R/3.4.2
Rscript --vanilla ordered_parameters.R ${JOB_NAME} ${JOB_ID} ${SGE_TASK_ID} ${TASK_NUMBERS[${SGE_TASK_ID}]}
