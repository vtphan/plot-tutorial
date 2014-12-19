#!/usr/local/bin/Rscript

options(warn=-1)
data_summary <- function(x) {
   return(c(y=mean(x),ymin=min(x),ymax=max(x)))
}

library(ggplot2)
library(tools)
args<-commandArgs(TRUE)

if (length(args) < 3 || length(args) > 4) {
   cat("\tUsage:  Rscript cq.R data_file x y [c]\n")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }

   data = read.table(args[1], header=T, sep=sep)
   if (length(args) >= 3) {
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_bar(stat="identity")  + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output1.png", width=7, height=7)
      cat("\tBarplot saved to output1.png\n")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_boxplot() + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output2.png", width=7, height=7)
      cat("\tBoxplot saved to output2.png\n")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output3.png", width=7, height=7)
      cat("\tViolinplot saved to output3.png\n")
   }
}
