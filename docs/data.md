## Understanding data

Data are stored in comma-separated (.csv) or tab-separated (.tsv) files.  Data files must have a header with names of columns. Each column represents a dimension of the data.  Each column consists of observations of a variable.  Data dimensions (variables) must be orthogonal, i.e. independent of each other.  Technically, this means data sets must be in [long form](http://statistics.ats.ucla.edu/stat/stata/modules/reshapel.htm).

Mostly, each variable can be quantitative or categorical.  Each observed data point of a quantitative variable is a number (integer or float).  Each observed data point of a categorical variable is usually a category.  When a quantitative variable has a small range, it can also be viewed as categorical.

A basic plot consists of two dimensions: x and y.  Typically, x describes a free or independent variable, whereas y is a dependent variable (which depends on x).  y can be a function of x, or is simply correlated to x in some unknown way.

### Example data sets

The datasets used in the examples are iris.csv, mtcars.csv and snp_caller.tsv.   Use the command "head" to look at the first few lines of datasets.  This will tell you what the column names are and what the first few rows look like.


irs.csv
```
> head iris.csv
"Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species"
5.1,3.5,1.4,0.2,"setosa"
4.9,3,1.4,0.2,"setosa"
4.7,3.2,1.3,0.2,"setosa"
4.6,3.1,1.5,0.2,"setosa"
5,3.6,1.4,0.2,"setosa"
5.4,3.9,1.7,0.4,"setosa"
```

mtcars.csv
```
> head mtcars.csv
"mpg","cyl","disp","hp","drat","wt","qsec","vs","am","gear","carb"
21,6,160,110,3.9,2.62,16.46,0,1,4,4
21,6,160,110,3.9,2.875,17.02,0,1,4,4
22.8,4,108,93,3.85,2.32,18.61,1,1,4,1
21.4,6,258,110,3.08,3.215,19.44,1,0,3,1
18.7,8,360,175,3.15,3.44,17.02,0,0,3,2
```

snp_callar.tsv
```
> head snp_caller.tsv
Alg   Cov   Precision   Recall   Fscore
GATK  1  0.99963  0.27484  0.431141273
GATK  2  0.99945  0.60776  0.755875999
GATK  3  0.9992   0.81044  0.894975407
GATK  4  0.99888  0.91302  0.954022091
GATK  5  0.99858  0.96069  0.979268626
```

