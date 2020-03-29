# Copyright (c) 2012,2015  Alexander Afanasyev <alexander.afanasyev@ucla.edu>

# install.packages('ggplot2')
library(ggplot2)
# install.packages('scales')
library(scales)
# install.packages('doBy')
library(doBy)
# install.packages('data.table')
library(data.table)


trace = "trace-outputs/l3-rate-trace.txt"
traceDir = "trace-outputs"
nonInfraSrc = ""
sparseInfraSrc = ""
modInfraSrc = ""
denseInfraSrc = ""
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  cat("No output dir supplied\n")
} else if (length(args)>=1) {
  # default output file
  traceDir = args[1]
  nonInfraSrc = paste(traceDir, "non-infra/summary-table.txt", sep="/", collapse=NULL)
  sparseInfraSrc = paste(traceDir, "sparse-infra/summary-table.txt", sep="/", collapse=NULL)
  modInfraSrc = paste(traceDir, "mod-infra/summary-table.txt", sep="/", collapse=NULL)
  denseInfraSrc = paste(traceDir, "dense-infra/summary-table.txt", sep="/", collapse=NULL)
}
traceOutput = paste(traceDir, "content-level-trace.txt", sep="/", collapse=NULL)
traceOutputCSV = paste(traceDir, "content-level-trace.csv", sep = "/", collapse = NULL)
print("Running content-level-graph.R...")
print(traceDir)

nonInfraData = read.table(nonInfraSrc, header=T)
sparseInfraData = read.table(sparseInfraSrc, header=T)
modInfraData = read.table(modInfraSrc, header=T)
denseInfraData = read.table(denseInfraSrc, header=T)

summaryFrame <- rbind(nonInfraData, sparseInfraData)
summaryFrame <- rbind(summaryFrame, modInfraData)
summaryFrame <- rbind(summaryFrame, denseInfraData)
names <- c("non-infra", "sparse-infra", "mod-infra", "dense-infra")

write.table(summaryFrame, traceOutput, sep="\t", quote=FALSE, row.names=names)
write.csv(summaryFrame, traceOutputCSV, quote=FALSE, row.names=names)
