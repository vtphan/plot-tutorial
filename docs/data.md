## Understanding data

Data are stored in comma-separated (.csv) or tab-separated (.tsv) files.  Data files must have a header with names of columns. Each column represents a dimension of the data.  Each column consists of observations of a variable.  Data dimensions (variables) must be orthogonal, i.e. independent of each other.  Technically, this means data sets must be in [long form](http://statistics.ats.ucla.edu/stat/stata/modules/reshapel.htm).

Mostly, each variable can be quantitative or categorical.  Each observed data point of a quantitative variable is a number (integer or float).  Each observed data point of a categorical variable is usually a category.  When a quantitative variable has a small range, it can also be viewed as categorical.

A basic plot consists of two dimensions: x and y.  Typically, x describes a free or independent variable, whereas y is a dependent variable (which depends on x).  y can be a function of x, or is simply correlated to x in some unknown way.
