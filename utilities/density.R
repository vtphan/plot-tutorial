#!/usr/local/bin/Rscript

data_summary <- function(x) {
   return(c(y=mean(x),ymin=min(x),ymax=max(x)))
}

library(ggplot2)
library(tools)
args<-commandArgs(TRUE)
# args[1] - data file
# args[2] - x
# args[3] - [c]

if (length(args) < 2 || length(args) > 3) {
   print("Usage:  Rscript qq.R data_file x [c]")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }
   data = read.table(args[1], header=T, sep=sep)
   if (length(args)==2) {
      ggplot(data, aes(x=eval(parse(text=args[2])))) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60")
      ggsave("output1.png")
      cat("Histogram (absolute count) saved to output.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=..density..)) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + geom_density()
      ggsave("output2.png")
      cat("Histogram (density) saved to output2.png\n")
   } else {
      ggplot(data, aes(x=eval(parse(text=args[2])))) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + facet_grid(eval(parse(text=paste(".~",args[3]))))
      ggsave("output1.png", width=10, height=6)
      cat("Histogram (absolute count) saved to output.png\n")

      ggplot(data, aes(x=eval(parse(text=args[2])), y=..density..)) + xlab(args[2]) + geom_histogram(fill="cornsilk", color="grey60") + geom_density() + facet_grid(eval(parse(text=paste(args[3],"~."))))
      ggsave("output2.png", width=6, height=10)
      cat("Histogram (density) saved to output2.png\n")

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_boxplot() + xlab(args[3]) + ylab(args[2]) #+ coord_flip()
      ggsave("output3.png")
      cat("Boxplot saved to output3.png\n")

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[3]) + ylab(args[2])
      ggsave("output4.png")
      cat("Violinplot saved to output4.png\n")

   }
}
