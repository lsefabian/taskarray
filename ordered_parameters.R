#!/usr/bin/env Rscript --vanilla

## In this example we use the order of arguments
## we passed in the number for this run a argument 4 and can use it once we convert it to a numeric from a string
numbertouse <- as.numeric(commandArgs(TRUE)[4])
numbertouse / 2.0
