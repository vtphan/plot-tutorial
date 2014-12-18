## Installation
- R
- ggplot2

## Scripts

1. qq.R - simple script to plot quantitative-quantitative plots, i.e. scatter plots.

Usage:
```
 Rscript qq.R data_file x y [z]
```

- data_file : comma-separated or tab-separated file, with a header and column names.  The data must be in long-form.
- x : the name of column in data_file representing the x-variable.
- y : the name of column in data_file representing the y-variable.
- z : Optional. The name of column in data_file representing the colorized grouping of data.

Examples:
```
  Rscript qq.R  ../../qq/data/snp_caller.tsv Precision Recall Alg
  Rscript qq.R ../examples/iris.csv Petal.Width Petal.Length
  Rscript qq.R ../examples/iris.csv Petal.Width Petal.Length Sepal.Width
```
