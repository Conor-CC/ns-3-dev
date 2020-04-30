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
persistentStaticSrc = ""
persistentMobileSrc = ""
transientStaticSrc = ""
transientMobileSrc = ""
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  cat("No output dir supplied\n")
} else if (length(args)>=1) {
  # default output file
  traceDir = args[1]
  persistentStaticSrc = paste(traceDir, "persistent-static/content-level-trace.txt", sep="/", collapse=NULL)
  persistentMobileSrc = paste(traceDir, "persistent-mobile/content-level-trace.txt", sep="/", collapse=NULL)
  transientStaticSrc = paste(traceDir, "transient-static/content-level-trace.txt", sep="/", collapse=NULL)
  transientMobileSrc = paste(traceDir, "transient-mobile/content-level-trace.txt", sep="/", collapse=NULL)
}
traceOutput = paste(traceDir, "demmand-level-trace.txt", sep="/", collapse=NULL)
traceOutputCSV = paste(traceDir, "demmand-level-trace.csv", sep = "/", collapse = NULL)
print("Running demmand-level-graph.R...")
print(traceDir)

persistentStaticData = read.table(persistentStaticSrc, header=T)
persistentStaticAvg <- data.frame(
  TotalKb = mean(persistentStaticData$TotalKb),
  TotalPackets = mean(persistentStaticData$TotalPackets),
  InSatisfiedInterests = mean(persistentStaticData$InSatisfiedInterests),
  OutSatisfiedInterests = mean(persistentStaticData$OutSatisfiedInterests),
  TotalNodes = mean(persistentStaticData$TotalNodes),
  TotalConsumers = mean(persistentStaticData$TotalConsumers),
  TotalProducers = mean(persistentStaticData$TotalProducers),
  AverageAwarenessDistance = mean(persistentStaticData$AverageAwarenessDistance),
  MinimumAwarenessDistance = mean(persistentStaticData$MinimumAwarenessDistance),
  MaximumAwarenessDistance = mean(persistentStaticData$MaximumAwarenessDistance),
  TotalInformed = mean(persistentStaticData$TotalInformed),
  TotalInformedBefore = mean(persistentStaticData$TotalInformedBefore),
  TotalSafelyInformed = mean(persistentStaticData$TotalSafelyInformed),
  TotalInformedAfter = mean(persistentStaticData$TotalInformedAfter)
)

persistentMobileData = read.table(persistentMobileSrc, header=T)
persistentMobileAvg <- data.frame(
  TotalKb = mean(persistentMobileData$TotalKb),
  TotalPackets = mean(persistentMobileData$TotalPackets),
  InSatisfiedInterests = mean(persistentMobileData$InSatisfiedInterests),
  OutSatisfiedInterests = mean(persistentMobileData$OutSatisfiedInterests),
  TotalNodes = mean(persistentMobileData$TotalNodes),
  TotalConsumers = mean(persistentMobileData$TotalConsumers),
  TotalProducers = mean(persistentMobileData$TotalProducers),
  AverageAwarenessDistance = mean(persistentMobileData$AverageAwarenessDistance),
  MinimumAwarenessDistance = mean(persistentMobileData$MinimumAwarenessDistance),
  MaximumAwarenessDistance = mean(persistentMobileData$MaximumAwarenessDistance),
  TotalInformed = mean(persistentMobileData$TotalInformed),
  TotalInformedBefore = mean(persistentMobileData$TotalInformedBefore),
  TotalSafelyInformed = mean(persistentMobileData$TotalSafelyInformed),
  TotalInformedAfter = mean(persistentMobileData$TotalInformedAfter)
)

transientStaticData = read.table(transientStaticSrc, header=T)
transientStaticAvg <- data.frame(
  TotalKb = mean(transientStaticData$TotalKb),
  TotalPackets = mean(transientStaticData$TotalPackets),
  InSatisfiedInterests = mean(transientStaticData$InSatisfiedInterests),
  OutSatisfiedInterests = mean(transientStaticData$OutSatisfiedInterests),
  TotalNodes = mean(transientStaticData$TotalNodes),
  TotalConsumers = mean(transientStaticData$TotalConsumers),
  TotalProducers = mean(transientStaticData$TotalProducers),
  AverageAwarenessDistance = mean(transientStaticData$AverageAwarenessDistance),
  MinimumAwarenessDistance = mean(transientStaticData$MinimumAwarenessDistance),
  MaximumAwarenessDistance = mean(transientStaticData$MaximumAwarenessDistance),
  TotalInformed = mean(transientStaticData$TotalInformed),
  TotalInformedBefore = mean(transientStaticData$TotalInformedBefore),
  TotalSafelyInformed = mean(transientStaticData$TotalSafelyInformed),
  TotalInformedAfter = mean(transientStaticData$TotalInformedAfter)
)

transientMobileData = read.table(transientMobileSrc, header=T)
transientMobileAvg <- data.frame(
  TotalKb = mean(transientMobileData$TotalKb),
  TotalPackets = mean(transientMobileData$TotalPackets),
  InSatisfiedInterests = mean(transientMobileData$InSatisfiedInterests),
  OutSatisfiedInterests = mean(transientMobileData$OutSatisfiedInterests),
  TotalNodes = mean(transientMobileData$TotalNodes),
  TotalConsumers = mean(transientMobileData$TotalConsumers),
  TotalProducers = mean(transientMobileData$TotalProducers),
  AverageAwarenessDistance = mean(transientMobileData$AverageAwarenessDistance),
  MinimumAwarenessDistance = mean(transientMobileData$MinimumAwarenessDistance),
  MaximumAwarenessDistance = mean(transientMobileData$MaximumAwarenessDistance),
  TotalInformed = mean(transientMobileData$TotalInformed),
  TotalInformedBefore = mean(transientMobileData$TotalInformedBefore),
  TotalSafelyInformed = mean(transientMobileData$TotalSafelyInformed),
  TotalInformedAfter = mean(transientMobileData$TotalInformedAfter)
)

summaryFrame <- rbind(persistentStaticAvg, persistentMobileAvg)
summaryFrame <- rbind(summaryFrame, transientStaticAvg)
summaryFrame <- rbind(summaryFrame, transientMobileAvg)
names <- c("persistent-static", "persistent-mobile", "transient-static", "transient-mobile")
write.table(summaryFrame, traceOutput, sep="\t", quote=FALSE, row.names=names)
write.csv(summaryFrame, traceOutputCSV, quote=FALSE, row.names=names)
