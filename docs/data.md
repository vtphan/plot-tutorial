## Understanding data

Data are stored in comma-separated (.csv) or tab-separated (.tsv) files.  Data files must have a header with names of columns. Each column represents a dimension of the data.

Data dimensions (variables) must be orthogonal, i.e. independent of each other.  Technically, this means data sets must be in [long form](http://statistics.ats.ucla.edu/stat/stata/modules/reshapel.htm).

We will deal with two types of variables: quantitative and categorical.  For quantitative variables, each data point is a number (integer or float).  For categorical variables, each data point is usually a category.  When a quantitative variable has a small range, it can also be viewed as categorical.

A basic plot consists of two dimensions: x and y.  Typically, x describes a free or independent variable, whereas y is a dependent variable (which depends on x).  y can be a function of x, or is simply correlated to x in some unknown way.
