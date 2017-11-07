#!/bin/bash

#$ -V
#$ -cwd

# Tell the SGE that this is an array job, with "tasks" to be numbered 1 to 46
#$ -t 1-46 -tc 20

## two minutes should be plenty for each task
#$ -l h_rt=00:02:00

#$ -N taskarray

#$ -o job_output/$JOB_NAME-$JOB_ID-$TASK_ID

echo "doing task ${SGE_TASK_ID}"

module add apps/R/3.4.2
Rscript --vanilla from_environment.R
