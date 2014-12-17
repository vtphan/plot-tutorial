# ggplot very basic tutorial

This tutorial provides basic examples of how to do basic data analysis using R/ggplot2.

## Installation

- R
- ggplot2
- reshape2 (recommended)

## Basic concepts

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

We will use dataset iris stored in examples/iris.csv. Load the dataset and take a look at its columns with the function "head".
```
   > data = read.table("examples/iris.csv", header=T, sep=",")
   > head(data)
  Sepal.Length Sepal.Width Petal.Length Petal.Width Species
1          5.1         3.5          1.4         0.2  setosa
2          4.9         3.0          1.4         0.2  setosa
3          4.7         3.2          1.3         0.2  setosa
4          4.6         3.1          1.5         0.2  setosa
5          5.0         3.6          1.4         0.2  setosa
6          5.4         3.9          1.7         0.4  setosa
```

## Plot quantitive versus quantitative data

Use a scatter plot to compare two quantitative variables, whose names are the appropriate column names.
```
   > ggplot(data, aes(x=Petal.Width, y=Petal.Length)) + geom_point()
```

<img src="examples/out1.png" width=80% height=80%/>

We can separate the points into groups defined by variable "Species".
```
   > ggplot(data, aes(x=Petal.Width, y=Petal.Length, color=Species)) + geom_point()
```

![](examples/out2.png)

## Plot qualitative versus quantitative data

