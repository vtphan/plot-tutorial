## <a name="qq"></a>Exploring Quantitative vs Quantitative Relationships

qq.R - plot quantitative (x) versus quantitative (y) data, i.e. scatter plots.

#### Usage
```
 qq.R data.csv x y [z]
```

- data.csv : comma-separated file (.csv) or tab-separated file (.tsv).  There must be a header containing column names.  The data must be in long-form.
- x : column name of quantitative variable x.
- y : column name of quantitative variable y.
- c : [Optional] column name of category to group data points.

#### Examples
```
  qq.R iris.csv Petal.Width Petal.Length
```
<img src="images/iris-wl.png" width=70% height=70% />

Categorized further by species.  In this case, two plots are produced: (i) groups are plotted together in one plot, (ii) groups are separated into different plots.

```
  qq.R iris.csv Petal.Width Petal.Length Species
```
<img src="images/iris-wl1.png" width=70% height=70% />
<img src="images/iris-wl2.png" width=70% height=70% />
