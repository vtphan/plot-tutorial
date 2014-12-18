#!/usr/local/bin/Rscript

library(ggplot2)
library(tools)
args<-commandArgs(TRUE)
# args[1] - data file
# args[2] - x
# args[3] - y
# args[4] - z (optional)

if (length(args) < 3 || length(args) > 4) {
   cat("Usage:  Rscript qq.R data_file x y [z]\n")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }

   data = read.table(args[1], header=T, sep=sep)
   if (length(args) == 3) {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3])
      ggsave("output.png")
      cat("Output saved to output.png\n")
   } else {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=eval(parse(text=args[4])))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4])
      ggsave("output1.png")
      cat("Output saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + facet_wrap(eval(parse(text=paste("~",args[4])))) + xlab(args[2]) + ylab(args[3])
      ggsave("output2.png")
      cat("Output saved to output2.png\n")
   }
}
