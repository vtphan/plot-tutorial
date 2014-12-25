#!/usr/local/bin/Rscript

options(warn=-1)
data_summary <- function(x) {
   return(c(y=mean(x),ymin=min(x),ymax=max(x)))
}

library(ggplot2)
library(tools)
args<-commandArgs(TRUE)

if (length(args) < 2 || length(args) > 3) {
   cat("Usage:  Rscript qq.R data_file x [c]\n")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }
   data = read.table(args[1], header=T, sep=sep)
   if (length(args)==2) {
      ggplot(data, aes(x=eval(parse(text=args[2])))) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60")
      ggsave("output1.png", width=7, height=7)
      cat("\tHistogram (absolute count) saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=..density..)) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + geom_density()
      ggsave("output2.png", width=7, height=7)
      cat("\tHistogram (density) saved to output2.png\n")
   } else {
      ggplot(data, aes(x=eval(parse(text=args[2])))) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + facet_grid(eval(parse(text=paste(".~",args[3]))))
      ggsave("output1.png", width=10, height=6)
      cat("\tHistogram (absolute count) saved to output1.png\n")

      ggplot(data, aes(x=eval(parse(text=args[2])), y=..density..)) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + geom_density() + facet_grid(eval(parse(text=paste(args[3],"~."))))
      ggsave("output2.png", width=6, height=10)
      cat("\tHistogram (density) saved to output2.png\n")

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_boxplot() + xlab(args[3]) + ylab(args[2]) #+ coord_flip()
      ggsave("output3.png", width=7, height=7)
      cat("\tBoxplot saved to output3.png\n")

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[3]) + ylab(args[2])
      ggsave("output4.png", width=7, height=7)
      cat("\tViolinplot saved to output4.png\n")

   }
}
