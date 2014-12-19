#!/usr/local/bin/Rscript

options(warn=-1)
library(ggplot2)
library(tools)
args<-commandArgs(TRUE)

if (length(args) < 3 || length(args) > 4) {
   cat("\tUsage:  Rscript qq.R data_file x y [c]\n")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }

   data = read.table(args[1], header=T, sep=sep)
   if (length(args) == 3) {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3])
      ggsave("output1.png", width=7, height=7)
      cat("\tScatter plot saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3]) + stat_smooth(method="lm")
      ggsave("output2.png", width=7, height=7)
      cat("\tLinearly-fitted plot saved to output2.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3]) + stat_smooth()
      ggsave("output3.png", width=7, height=7)
      cat("\tNonlinearly-fitted plot saved to output3.png\n")
   } else {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=factor(eval(parse(text=args[4]))), color=factor(eval(parse(text=args[4]))))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4])
      ggsave("output1.png", width=7, height=7)
      cat("\tScatter plot saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=factor(eval(parse(text=args[4]))))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4]) + stat_smooth(method="lm")
      ggsave("output2.png", width=7, height=7)
      cat("\tLinear-fitted plot saved to output2.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=factor(eval(parse(text=args[4]))))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4]) + stat_smooth()
      ggsave("output3.png", width=7, height=7)
      cat("\tNonlinear-fitted plot saved to output3.png\n")

      # ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + facet_wrap(eval(parse(text=paste("~",args[4])))) + xlab(args[2]) + ylab(args[3]) + stat_smooth()
      # ggsave("output2.png")
      # cat("\tOutput saved to output2.png\n")
   }
}
