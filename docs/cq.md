## <a name="cq"></a> Exploring categorical versus quantitative relationships

cq.R - plot categorical (x) versus quantitative (y) data.

#### Usage
```
 cq.R data.csv x y [c]
```

- data.csv : comma-separated file (.csv) or tab-separated file (.tsv).  There must be a header containing column names.  The data must be in long-form.
- x : column name of categorical variable x.
- y : column name of quantitative variable y.
- c : Optional category variable, which should consist of few categorical values.

The output consists of 3 plots: (i) a bar chart that sums up quantitative values for each category, (ii) a box plot that shows quartile statistics of each category, and (iii) a violin plot that shows distributions of values in each category.

#### Basic use: plotting x versus y
```
 cq.R mtcars.csv cyl disp
```
<img src="images/cyl-disp1.png" width=70% height=70%/>
<img src="images/cyl-disp2.png" width=70% height=70%/>
<img src="images/cyl-disp3.png" width=70% height=70%/>


#### Adding a third categorical dimension

```
 cq.R mtcars.csv cyl disp carb
```

<img src="images/cyl-disp-carb1.png" width=70% height=70%/>
<img src="images/cyl-disp-carb2.png" width=70% height=70%/>
<img src="images/cyl-disp-carb3.png" width=70% height=70%/>
