#!/usr/bin/env Rscript --vanilla

## In this example we properly parse the argument, having the type converted for us, and provide usage help
## so that its clearer what is being expected and the order is irrelevant

##  Rscript --vanilla named_parameters.R --help
##  Usage: named_parameters.R [options]
##  
##  
##  Options:
##      --jobname=CHARACTER
##          name of job
##  
##      --jobid=INTEGER
##          id of job
##  
##      --taskid=INTEGER
##          id of task within job
##  
##      --numbertouse=INTEGER
##          a plain value to pass in
##  
##      -h, --help
##          Show this help message and exit

library("optparse")
 
option_list = list(
  make_option(c("--jobname"), type="character", default=NULL, help="name of job", metavar="character"),
  make_option(c("--jobid"), type="integer", default=NULL, help="id of job", metavar="integer"),
  make_option(c("--taskid"), type="integer", default=NULL, help="id of task within job", metavar="integer"),
  make_option(c("--numbertouse"), type="integer", default=NULL, help="a plain value to pass in", metavar="integer")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

opt$numbertouse / 2.0
