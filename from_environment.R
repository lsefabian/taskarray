#!/usr/bin/env Rscript --vanilla

## In this example we take the job and task id from the environment
jobname <- Sys.getenv('JOB_NAME')
hostname <- Sys.getenv('HOSTNAME')
jobid <- as.numeric(Sys.getenv('JOB_ID'))
taskid <- as.numeric(Sys.getenv('SGE_TASK_ID'))


printf <- function(...) invisible(print(sprintf(...)))

printf("job named %s running on %s jobid %d taskid %d", jobname, hostname, jobid, taskid)

## the taskid can not start at 0 so if you need that then take one from the taskid
numbertouse <- taskid - 1

numbertouse / 2.0

