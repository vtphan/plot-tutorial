#!/usr/local/bin/Rscript

data_summary <- function(x) {
   return(c(y=mean(x),ymin=min(x),ymax=max(x)))
}

QQ <- function() {
   if (length(args) == 3) {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3])
      ggsave("output1.png", width=7, height=7)
      cat("\tScatter plot saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])))) + geom_point() + xlab(args[2]) + ylab(args[3]) + stat_smooth(method="lm")
      ggsave("output2.png", width=7, height=7)
      cat("\tLinearly-fitted plot saved to output2.png\n")
   } else {
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=factor(eval(parse(text=args[4]))), color=factor(eval(parse(text=args[4]))))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4])
      ggsave("output1.png", width=7, height=7)
      cat("\tScatter plot saved to output1.png\n")
      ggplot(data, aes(x=eval(parse(text=args[2])), y=eval(parse(text=args[3])), color=factor(eval(parse(text=args[4]))))) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4]) + stat_smooth(method="lm")
      ggsave("output2.png", width=7, height=7)
      cat("\tLinear-fitted plot saved to output2.png\n")
   }
   if (length(levels(factor(data[,args[2]]))) <= 30) {
      CQ("output3.png", "output4.png")
   }
}

CQ <- function(out1="output1.png", out2="output2.png") {
   if (length(args) >= 3) {
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_boxplot() + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave(out1, width=7, height=7)
      cat("\tBoxplot saved to", out1, "\n")
      p <- ggplot(data, aes(x=factor(eval(parse(text=args[2]))), y=eval(parse(text=args[3])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[2]) + ylab(args[3])
      if (length(args)==4) {
         p <- p + facet_wrap(eval(parse(text=paste("~",args[4]))))
      }
      p
      ggsave(out2, width=7, height=7)
      cat("\tViolinplot saved to", out2, "\n")
   }
}

DENSITY <- function() {
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

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_boxplot() + xlab(args[3]) + ylab(args[2])
      ggsave("output3.png", width=7, height=7)
      cat("\tBoxplot saved to output3.png\n")

      ggplot(data, aes(x=factor(eval(parse(text=args[3]))), y=eval(parse(text=args[2])))) + geom_violin(trim=FALSE) +  stat_summary(fun.y=data_summary, fun.ymin=min, fun.ymax=max) + xlab(args[3]) + ylab(args[2])
      ggsave("output4.png", width=7, height=7)
      cat("\tViolinplot saved to output4.png\n")
   }
}

options(warn=-1)
library(ggplot2)
library(tools)
args<-commandArgs(TRUE)

if (length(args) < 2 || length(args) > 4) {
   cat("Plot one variable:\n\tezplot.R data.csv x [c]\n")
   cat("Plot two variables:\n\tezplot.R data.csv x y [c]\n")
   cat("c is an optional categorical variable.\n")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }

   data = read.table(args[1], header=T, sep=sep)
   if (length(args) > 2) {
      catx <- tail(class(data[,args[2]]), n=1)
      caty <- tail(class(data[,args[3]]), n=1)
      cat(catx, caty, "\n")
      if ((catx %in% c("numeric","integer")) && (caty %in% c("numeric", "integer"))) {
         QQ()
      } else if (!(catx %in% c("numeric","integer")) && (caty %in% c("numeric", "integer"))) {
         CQ()
      } else if ((catx %in% c("numeric","integer")) && !(caty %in% c("numeric", "integer"))) {
         DENSITY()
      }
   } else {
      DENSITY()
   }
}
