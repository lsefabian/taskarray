# taskarray
Example jobs to use the task array options in SGE


When you run a job in Sun Grid Engine (SGE) a number of environment variables are set including JOB_NAME and JOB_ID.

When you run a task array job each task also gets a unique SGE_TASK_ID.

We can use these environment variables directly using R's Sys.getenv('SGE_TASK_ID')

```bash
module add apps/R
qsub -V -t 1-5 -b yes -cwd -N taskarray -o 'job_output/$JOB_NAME-$JOB_ID-$TASK_ID' $(which Rscript) --vanilla from_environment.R
```

We have to take care that we convert any numeric values from the strings Sys.getenv() provides

But it is cleaner and clearer for future use if the options are put into qsub script and run.

```bash
qsub from_environment.sh
```

Rather than have R directly read the environment variables we can use the values in the qsub script and manipulate them with shell syntax and then pass them to the script as options.

# reading options in R

we can use R's commandArgs() to read the options provided we maintain the order

```bash
qsub ordered_parameters.sh
```

cleaner and clearer is to name the parameters and parse them using the optparse package package. This has the added benefit of supporting numerics directly.

```bash
qsub named_parameters.sh
```
