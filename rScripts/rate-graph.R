# Copyright (c) 2012,2015  Alexander Afanasyev <alexander.afanasyev@ucla.edu>

# install.packages('ggplot2')
library(ggplot2)
# install.packages('scales')
library(scales)
# install.packages('doBy')
library(doBy)
# install.packages('data.table')
library(data.table)


output = "Rplots.pdf"
trace = "trace-outputs/l3-rate-trace.txt"
traceDir = "trace-outputs"
args = commandArgs(trailingOnly=TRUE)
if (length(args)==0) {
  cat("No output dir supplied\n")
} else if (length(args)>=1) {
  # default output file
  output = paste(args[1], output, sep="/", collapse=NULL)
  traceDir = args[1]
  trace = paste(args[1], "l3-rate-trace.txt", sep="/", collapse=NULL)
}
analysisOutputFile = paste (traceDir, "analysis-output.txt", sep = "/", collapse = NULL)
awarenessTrace = paste(traceDir, "awareness-trace.txt", sep = "/", collapse = NULL)
summaryTableFile = paste(traceDir, "summary-table.txt", sep = "/", collapse = NULL)
summaryTableCSV = paste(traceDir, "summary-table.csv", sep = "/", collapse = NULL)
print("Running rate-graph.R...")
print(traceDir)
sink(analysisOutputFile, append=FALSE)
print(traceDir)
print(analysisOutputFile)
print(awarenessTrace)
print(output)
print(summaryTableFile)
print(summaryTableCSV)

#########################
# Rate trace processing #
#########################
data = read.table(trace, header=T)
awarenessData = read.table(awarenessTrace, header=T)
data$Node = factor(data$Node)
data$FaceId <- factor(data$FaceId)
data$Kilobits <- data$Kilobytes * 8
data$Type = factor(data$Type)

data = subset(data, grepl("^netdev", data$FaceDescr))
data.totalKb = sum(data$Kilobits)
cat("\nL3RateTracer Results\n========================================\nTotal Kilobits: ")
totalKb = data.totalKb
print(totalKb)
cat("Total Packets ")
totalPackets = sum(data$Packets)
print(totalPackets)
cat("Total InSatisfiedInterests ")
inSatisfiedInterests = sum(subset(data, Type %in% c("InSatisfiedInterests"))$Packets)
print(inSatisfiedInterests)
cat("Total OutSatisfiedInterests ")
outSatisfiedInterests = sum(subset(data, Type %in% c("OutSatisfiedInterests"))$Packets)
print(outSatisfiedInterests)
cat("Total Nodes ")
totalNodes = length(table(data$Node))
print(totalNodes)
cat("Total Consumers ")
totalConsumers = length(table(awarenessData$NodeId))
print(totalConsumers)
cat("Total Producers ")
totalProducers = totalNodes - totalConsumers
print(totalConsumers)
cat("\n")
data = subset(data, Type %in% c("OutData", "InData", "OutInterests", "InInterests", "OutSatisfiedInterests", "InSatisfiedInterests"))



cat("AwarenessTraceOutput Results (For Consumers)\n========================================\nAverage Awareness Distance: ")
averageAwarenessDistance = mean(awarenessData$AwarenessDistance)
print(averageAwarenessDistance)
cat("Minimum AwarenessDistance ")
minimumAwarenessDistance = min(awarenessData$AwarenessDistance)
print(minimumAwarenessDistance)
cat("Maximum AwarenessDistance ")
maximumAwarenessDistance = max(awarenessData$AwarenessDistance)
print(maximumAwarenessDistance)
cat("Sum of Nodes that were informed ")
totalInformed = sum(awarenessData$WasInformed)
print(totalInformed)
cat("Sum of Nodes informed before content ")
totalInformedBefore = length(table(subset(awarenessData, AwarenessDistance>=0)$NodeId))
print(totalInformedBefore)
cat("Sum of Nodes that were safely informed ")
totalSafelyInformed = sum(awarenessData$SafelyInformed)
print(totalSafelyInformed)
cat("Sum of Nodes informed after content ")
totalInformedAfter = length(table(subset(awarenessData, AwarenessDistance<0)$NodeId))
print(totalInformedAfter)


summaryFrame <- data.frame(
  TotalKb = totalKb,
  TotalPackets = totalPackets,
  InSatisfiedInterests = inSatisfiedInterests,
  OutSatisfiedInterests = outSatisfiedInterests,
  TotalNodes = totalNodes,
  TotalConsumers = totalConsumers,
  TotalProducers = totalProducers,
  AverageAwarenessDistance = averageAwarenessDistance,
  MinimumAwarenessDistance = minimumAwarenessDistance,
  MaximumAwarenessDistance = maximumAwarenessDistance,
  TotalInformed = totalInformed,
  TotalInformedBefore = totalInformedBefore,
  TotalSafelyInformed = totalSafelyInformed,
  TotalInformedAfter = totalInformedAfter
)
write.table(summaryFrame, summaryTableFile, sep="\t", quote=FALSE, row.names=FALSE)
write.csv(summaryFrame, summaryTableCSV, quote=FALSE, row.names=FALSE)



pdf(output)
# combine stats from all faces
data.combined = summaryBy(. ~ Time + Node + Type, data=data, FUN=sum)
# graph rates on all nodes in Kilobits
g.all <- ggplot(data.combined) +
geom_point(aes (x=Time, y=Kilobits.sum, color=Type), size=1) +
ylab("Rate [Kbits/s]") +
facet_wrap(~ Node)

print(g.all)

# graph rates on the root nodes in Packets
g.combined <- ggplot(data.combined) +
geom_point(aes (x=Time, y=Kilobits.sum, color=Type), size=2) +
geom_line(aes (x=Time, y=Kilobits.sum, color=Type), size=2) +
ylab("Rate [Kbits/s]")

print(g.combined)

png("rate-graph.png", width=1920, height=1080)
# print(g.all)
retval <- dev.off()
