library(ggplot2)
library(tools)
args<-commandArgs(TRUE)
# args[1] - data file
# args[2] - x
# args[3] - y
# args[4] - color (optional)

if (length(args) < 3 || length(args) > 4) {
   print("Usage:  Rscript qq.R data_file x y [color]")
} else {
   sep <- "\t"
   if (file_ext(args[1]) == "csv") {
      sep <- ","
   }

   data = read.table(args[1], header=T, sep=sep)
   if (length(args) == 3) {
      ggplot(data, aes(x=data[,args[2]], y=data[,args[3]])) + geom_point() + xlab(args[2]) + ylab(args[3])
   } else {
      ggplot(data, aes(x=data[,args[2]], y=data[,args[3]], color=data[,args[4]])) + geom_point() + xlab(args[2]) + ylab(args[3]) + labs(color=args[4])
   }
   ggsave("output.png")
}
