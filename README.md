# ggplot very basic tutorial

This tutorial provides basic examples of how to do basic data analysis using R/ggplot2.

## Installation

- R
- ggplot2
- reshape2 (recommended)

## Understanding data types

Each data set should be stored in columns separated by tabs or commas.  There should be a header, providing the name of each column.

Essentially, there are two types of data: quantitative and qualitative.  Quantitative are numerical data and qualitative data are categorical.

A basic plot consists of two dimensions: x and y.  Typically, x describes a free or independent variable, whereas y is a dependent variable (which depends on x).  y can be a function of x, or is simply correlated to x in some unknown way.

## Starting up

Start by running the R interpreter at the command line:
```
   $ R
```

Inside the interpreter, load the library ggplot2:
```
   > library(ggplot2)
```

## Load the data

We will use dataset iris stored in examples/iris.csv. Load the dataset and take a look at its columns.
```
   > data = read.table("examples/iris", header=T, sep=",")
   > head(data)
```
