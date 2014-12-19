## <a name="qq"></a>Exploring Quantitative vs Quantitative Relationships

qq.R - plot quantitative (x) versus quantitative (y) data, i.e. scatter plots.

#### Usage
```
 qq.R data.csv x y [c]
```

- data.csv : comma-separated file (.csv) or tab-separated file (.tsv).  There must be a header containing column names.  The data must be in long-form.
- x : column name of quantitative variable x.
- y : column name of quantitative variable y.
- c : Optional category variable, which should consist of few categorical values.

#### Examples
```
  qq.R iris.csv Petal.Width Petal.Length
```

The output consists of 3 plots, with and without data fitting.

<img src="images/iris-wl1.png" width=70% height=70% />
<img src="images/iris-wl2.png" width=70% height=70% />
<img src="images/iris-wl3.png" width=70% height=70% />

Categorized further by species.

```
  qq.R iris.csv Petal.Width Petal.Length Species
```

<img src="images/iris-c1.png" width=70% height=70% />
<img src="images/iris-c2.png" width=70% height=70% />
<img src="images/iris-c3.png" width=70% height=70% />
