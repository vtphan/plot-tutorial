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
   print("Usage:  Rscript qq.R data_file x y [z]")
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
      print("Barplot saved to output1.png")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_boxplot() + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output2.png")
      print("Boxplot saved to output2.png")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave("output3.png")
      print("Violinplot saved to output3.png")
   }
}
