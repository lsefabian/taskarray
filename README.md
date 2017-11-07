# taskarray
Example jobs to use the task array options in SGE

When you run a job in Sun Grid Engine (SGE) a number of environment variables are set including JOB_NAME and JOB_ID.

When you run a task array job each task also gets a unique SGE_TASK_ID.

We can use these environment variables directly, for example in R Sys.getenv('SGE_TASK_ID')

To run a task array job add the -t flag with a description of the range to use in one of the following formats.

* -t 3     - run tasks 1,2 and 3
* -t 2-6   - run tasks 2,3,4,5 and 6
* -t 1-7:2 - run tasks 1,3,5 and 7

The number to start at has to be positive (and can not be 0). 

Optionally, but recommended, you can limit the number of tasks to run at once with the -tc flag.

```bash
module add apps/R
qsub -V -t 1-7:2 -tc 3 -b yes -cwd -N taskarray -o 'job_output/$JOB_NAME-$JOB_ID-$TASK_ID' $(which Rscript) --vanilla from_environment.R
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
