#!/usr/local/bin/Rscript

data_summary <- function(x) {
   return(c(y=mean(x),ymin=min(x),ymax=max(x)))
}

library(ggplot2)
library(tools)
args<-commandArgs(TRUE)
# args[1] - data file
# args[2] - x
# args[3] - y
# args[4] - z (optional)

if (length(args) < 3 || length(args) > 4) {
   cat("Usage:  Rscript qq.R data_file x y [c]\n")
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
      ggsave("output1.png")
      cat("Barplot saved to output1.png\n")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_boxplot() + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output2.png")
      cat("Boxplot saved to output2.png\n")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output3.png")
      cat("Violinplot saved to output3.png\n")
   }
}
