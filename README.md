# causalinmisdata

[Go back to homepage](https://mcl868.github.io/software.html)

To install the package from GitHub:
```markdown
install.packages("devtools")
devtools::install_github("mcl868/causalinmisdata")
```
If the package *devtools* is already installed then it is **not** necessary to use the command
*install.packages("devtools")*.

This package requires additional three packages
[HelpPackage](https://github.com/mcl868/HelpPackage/blob/master/README.md),
[combinat](https://cran.r-project.org/web/packages/combinat/index.html)
and
[gtools](https://cran.r-project.org/web/packages/gtools/index.html).

Robins [[1]](https://github.com/mcl868/causalinmisdata/blob/master/README.md#bibliography)
defines the g-formula given by

<a href="https://www.codecogs.com/eqnedit.php?latex=E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_T=\overline{a}_T,&space;\overline{L}_T=\overline{l}_T)&space;\prod_{t=0}^Tf_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t." target="_blank"><img src="https://latex.codecogs.com/gif.latex?E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_T=\overline{a}_T,&space;\overline{L}_T=\overline{l}_T)&space;\prod_{t=0}^Tf_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t." title="E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}} E(Y\mid \overline{A}_T=\overline{a}_T, \overline{L}_T=\overline{l}_T) \prod_{t=0}^Tf_{L_t\mid \overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid \overline{l}_{t-1},\overline{a}_{t-1}) d\overline{l}_t." /></a>

## This package contains following functions

### For binary exposure
- [g.dicho](https://github.com/mcl868/packagedevelop/blob/master/README.md#gdicho)
- [missing.pattern](https://github.com/mcl868/packagedevelop/blob/master/README.md#missingpattern)
- [prob.of.missing](https://github.com/mcl868/packagedevelop/blob/master/README.md#probofmissing)
- [g.dr.dicho](https://github.com/mcl868/packagedevelop/blob/master/README.md#gaipwccdicho)

#### Sequential mediation
- [seq.mediator]

Look at the example to see how to use **g.dicho**.
The example have a DAG with three binary exposure and time-depending confounding.
The example is extended data with variable with missing values.

# g.dicho
The estimator for the g-formula for binary exposures and continuous outcomes
```markdown
g.dicho(mmodels,
        exposure,
        data, ...)
```

**Input**
- *mmodels*: Models corresponding to response. See example.
- *exposure*: The time-varying exposure. See example.
- *data*: Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*: The exposure of the analysis.

For further information about the function write *?g.dicho* in r.

# seq.mediator
The estimator for sequential mediation for binary exposures and continuous outcomes
```markdown
seq.mediator(mmodels,
             exposure,
             int,
             data, ...)
```

**Input**
- *mmodels*: Models corresponding to response. See example.
- *exposure*: The time-varying exposure. See example.
- *int*: The time-varying exposure. See example.
- *data*: Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *coef*:     The coefficients from the analysis.
- *exposure*: The exposure of the analysis.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.

For further information about the function write *?g.dicho* in r.









## Example

<a href="https://www.codecogs.com/eqnedit.php?latex=E\left(Y^{(a_0,a_1,a_2)}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_2=\overline{a}_2,&space;\overline{L}_2=\overline{l}_2)&space;\prod_{t=0}^2f_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?E\left(Y^{(a_0,a_1,a_2)}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_2=\overline{a}_2,&space;\overline{L}_2=\overline{l}_2)&space;\prod_{t=0}^2f_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t" title="E\left(Y^{(a_0,a_1,a_2)}\right)=\int_{\mathcal{L}} E(Y\mid \overline{A}_2=\overline{a}_2, \overline{L}_2=\overline{l}_2) \prod_{t=0}^2f_{L_t\mid \overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid \overline{l}_{t-1},\overline{a}_{t-1}) d\overline{l}_t" /></a>

<a href="https://www.codecogs.com/eqnedit.php?latex=\overline{A}_2=(A_0,A_1,A_2)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\overline{A}_2=(A_0,A_1,A_2)" title="\overline{A}_2=(A_0,A_1,A_2)" /></a>


<a href="https://www.codecogs.com/eqnedit.php?latex=\overline{a}_2=(a_0,a_1,a_2)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\overline{a}_2=(a_0,a_1,a_2)" title="\overline{a}_2=(a_0,a_1,a_2)" /></a>



<a href="https://www.codecogs.com/eqnedit.php?latex=\overline{L}_2=(L_0,L_1,L_2)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\overline{L}_2=(L_0,L_1,L_2)" title="\overline{L}_2=(L_0,L_1,L_2)" /></a>


<a href="https://www.codecogs.com/eqnedit.php?latex=\overline{l}_2=(l_0,l_1,l_2)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\overline{l}_2=(l_0,l_1,l_2)" title="\overline{l}_2=(l_0,l_1,l_2)" /></a>

### Simulation
We assume 3 binary exposures
<a href="https://www.codecogs.com/eqnedit.php?latex=A_i" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?A_i" title="A_i" /></a>
and continuous outcome
<a href="https://www.codecogs.com/eqnedit.php?latex=Y" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?Y" title="Y" /></a>.
Let
<a href="https://www.codecogs.com/eqnedit.php?latex=L_i" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?L_i" title="L_i" /></a>
be time-depending confounding for
<a href="https://www.codecogs.com/eqnedit.php?latex=i=0,...,2" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?i=0,...,2" title="i=0,...,2" /></a>.
Let data be generated by the following models:

<a href="https://www.codecogs.com/eqnedit.php?latex=\\L_0:=\varepsilon&space;\\A_0:=p(0.6L_0)&space;\\L_1:=-A_0&plus;0.2L_0-A_0L_0&plus;\varepsilon&space;\\A_1:=p(-1&plus;1.6A_0&plus;1.2L_1-0.8L_0-1.6L_1A_0)&space;\\L_2:=A_1&plus;L_1-A_0&plus;1.2L_0&plus;\varepsilon&space;\\A_2:=p(1-0.8L_0&plus;1.6A_0&plus;1.2L_1&plus;1.3A_1&plus;0.5L_2&plus;1.6L_1A_1)&space;\\Y:=2L_0&plus;3A_0&plus;L_1&plus;2A_1-2L_2&plus;A_2&plus;L_2A_2&plus;\varepsilon" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?\\L_0:=\varepsilon&space;\\A_0:=p(0.6L_0)&space;\\L_1:=-A_0&plus;0.2L_0-A_0L_0&plus;\varepsilon&space;\\A_1:=p(-1&plus;1.6A_0&plus;1.2L_1-0.8L_0-1.6L_1A_0)&space;\\L_2:=A_1&plus;L_1-A_0&plus;1.2L_0&plus;\varepsilon&space;\\A_2:=p(1-0.8L_0&plus;1.6A_0&plus;1.2L_1&plus;1.3A_1&plus;0.5L_2&plus;1.6L_1A_1)&space;\\Y:=2L_0&plus;3A_0&plus;L_1&plus;2A_1-2L_2&plus;A_2&plus;L_2A_2&plus;\varepsilon" title="\\L_0:=\varepsilon \\A_0:=p(0.6L_0) \\L_1:=-A_0+0.2L_0-A_0L_0+\varepsilon \\A_1:=p(-1+1.6A_0+1.2L_1-0.8L_0-1.6L_1A_0) \\L_2:=A_1+L_1-A_0+1.2L_0+\varepsilon \\A_2:=p(1-0.8L_0+1.6A_0+1.2L_1+1.3A_1+0.5L_2+1.6L_1A_1) \\Y:=2L_0+3A_0+L_1+2A_1-2L_2+A_2+L_2A_2+\varepsilon" /></a>

where all
<a href="https://www.codecogs.com/eqnedit.php?latex=\varepsilon" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?\varepsilon" title="\varepsilon" /></a>
are normal distributed with mean zero and variance one and

<a href="https://www.codecogs.com/eqnedit.php?latex=p(x):=\frac{\exp(x)}{1&plus;\exp(x)}" target="_blank">
<img src="https://latex.codecogs.com/gif.latex?p(x):=\frac{\exp(x)}{1&plus;\exp(x)}" title="p(x):=\frac{\exp(x)}{1+\exp(x)}" /></a>.

Sample size for each data is 2000 and data are replicated 2000 times.

The directed acyclic graph (DAG) for the data is

![](Images/dag.png)

The marginal structural model (MSM) is given by

<a href="https://www.codecogs.com/eqnedit.php?latex=E\left(Y^{(a_0,a_1,a_2)}\right)=6a_0&plus;4a_1&plus;5a_2-2a_0a_2-a_1a_2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?E\left(Y^{(a_0,a_1,a_2)}\right)=6a_0&plus;4a_1&plus;5a_2-2a_0a_2-a_1a_2" title="E\left(Y^{(a_0,a_1,a_2)}\right)=6a_0+4a_1+5a_2-2a_0a_2-a_1a_2" /></a>

#### Data
set.seed(3)

#### Estimation with the simpler estimator
```markdown
model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- L2 ~ A1 + L1 + A0 + L0
model3 <- L1 ~ A0 + L0 + A0*L0

estimationSG<-lapply(1:loop,function(iiii) g.dicho(mmodels=c(model1,model2,model3),
                                                   exposure=c("A0","A1","A2"),
                                                   data=DataSetList[[iiii]])$coef)
round(listMean(estimationSG),3)
```

### missing.pattern
```markdown
missing.pattern(response,
                covariates,
                data, ...)
```

**Input**
- *response*:   The outcome variable of the interest.
- *covariates*: The ordered sequence of the variables of the interest.
- *data*:       The data.

**Output**
- *data*:          The data of the chosen pattern of missingness (used in the function **prob.of.missing**).
- *covariatesObj*: The ordered sequence of the variables of the interest (used in the function **prob.of.missing**).
- *responseObj*:   The outcome variable of the interest (used in the function **prob.of.missing**).
- *count*:         The number of the observed variables in integers.
- *percent*:       The percent of the observed variables.

### Missing data


<a href="https://www.codecogs.com/eqnedit.php?latex=\\\lambda_1(G_1(Z))&:=p(-2.2-0.5L_0)&space;\\\lambda_2(G_2(Z))&:=p(-2.3&plus;0.2L_0-0.2A_0)&space;\\\lambda_3(G_3(Z))&:=p(-2.4-0.3L_0&plus;0.2A_0-0.2L_1)))&space;\\\lambda_4(G_4(Z))&:=p(-2.3&plus;0.4L_0&plus;0.2A_0&plus;0.8L_1&plus;0.5A_1)&space;\\\lambda_5(G_5(Z))&:=p(-2.2&plus;0.4L_0&plus;0.2A_0&plus;0.7L_1&plus;0.5A_1-0.3L_2)&space;\\\lambda_6(G_6(Z))&:=p(-2.0&plus;0.4L_0&plus;0.2A_0&plus;0.7L_1-0.5A_1-0.3L_2&plus;1.2A_2-1.4A_1A_2)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\\\lambda_1(G_1(Z))&:=p(-2.2-0.5L_0)&space;\\\lambda_2(G_2(Z))&:=p(-2.3&plus;0.2L_0-0.2A_0)&space;\\\lambda_3(G_3(Z))&:=p(-2.4-0.3L_0&plus;0.2A_0-0.2L_1)))&space;\\\lambda_4(G_4(Z))&:=p(-2.3&plus;0.4L_0&plus;0.2A_0&plus;0.8L_1&plus;0.5A_1)&space;\\\lambda_5(G_5(Z))&:=p(-2.2&plus;0.4L_0&plus;0.2A_0&plus;0.7L_1&plus;0.5A_1-0.3L_2)&space;\\\lambda_6(G_6(Z))&:=p(-2.0&plus;0.4L_0&plus;0.2A_0&plus;0.7L_1-0.5A_1-0.3L_2&plus;1.2A_2-1.4A_1A_2)" title="\\\lambda_1(G_1(Z))&:=p(-2.2-0.5L_0) \\\lambda_2(G_2(Z))&:=p(-2.3+0.2L_0-0.2A_0) \\\lambda_3(G_3(Z))&:=p(-2.4-0.3L_0+0.2A_0-0.2L_1))) \\\lambda_4(G_4(Z))&:=p(-2.3+0.4L_0+0.2A_0+0.8L_1+0.5A_1) \\\lambda_5(G_5(Z))&:=p(-2.2+0.4L_0+0.2A_0+0.7L_1+0.5A_1-0.3L_2) \\\lambda_6(G_6(Z))&:=p(-2.0+0.4L_0+0.2A_0+0.7L_1-0.5A_1-0.3L_2+1.2A_2-1.4A_1A_2)" /></a>


### prob.of.missing
```markdown
prob.of.missing(object,
                regression,
                list.out = TRUE,
                completecase = FALSE,
                regList,
                order=NULL, ...)
```
**Input**
- *object*:       The object is a *DataToPattern* and comes from the function **missing.pattern**.
- *regression*:   The models for stopping observing additional variables in a monotone pattern.
- *list.out*:     If it is equal to TRUE then output is a list, see **Output**. If it is equal to FALSE then output is data only.
- *completecase*: If it is equal to TRUE then data.frame is only complete cases.
- *regList*:      The list consist of the models to estimate the probabilities for the missingness in data.
- *order*:        The order of measurement in data.

**Output**
- *data*:     The data of the choosen pattern of missingness ssh (exist *if list.out is equal to TRUE of FALSE*).
- *regList*:  The regression models that been used to obtain lambda (exist *if list.out is equal to TRUE*).
- *CoefList*: The coefficients form the regression models (exist *if list.out is equal to TRUE*).
- *count*:    The numbers of the observed variables in integers (exist *if list.out is equal to TRUE*).
- *percent*:  The percent of the observed variables (exist *if list.out is equal to TRUE*).



### Missing estimation
```markdown
estimationMis<-list()
for(iiii in 1:loop){
  estimationMis[[iiii]]<-g.dr.dicho(mmodels=c(model1,model2,model3),
                                        pmodels=c(pi1,pi2,pi3),
                                        data=DataSetList[[iiii]],
                                        covariates=c("L0","A0","L1","A1","L2","A2"),
                                        pattern = "Monotone",
                                        regList=regList)}
```


### Missing estimation
```markdown
seq.mediator(mmodels,
             exposure,
             int,
             data,
             ...)
```







# g.dr.dicho
The estimator for the g-formula for binary exposures and continuous outcomes with data
with missing observations following a monotone pattern
```markdown
g.dr.dicho(mmodels,
           exposure,
           covariates,
           regList,
           augList=NULL,
           data, ...)
```

**Input**
- *mmodels*: Models corresponding to response. See example.
- *exposure*: The time-varying exposure. See example.
- *covariates*: The time-varying exposure. See example.
- *regList*: The time-varying exposure. See example.
- *augList*: The time-varying exposure. See example.
- *data*: Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*: The exposure of the analysis.

For further information about the function write *?g.dr.dicho* in r.


# seq.dr.mediator
The estimator for sequential mediation for binary exposures and continuous outcomes with data
with missing observations following a monotone pattern
```markdown
seq.dr.mediator(mmodels,
                exposure,
                int,
                covariates,
                regList,
                augList=NULL,
                data, ...)
```

**Input**
- *mmodels*: Models corresponding to response. See example.
- *exposure*: The time-varying exposure. See example.
- *covariates*: The time-varying exposure. See example.
- *regList*: The time-varying exposure. See example.
- *augList*: The time-varying exposure. See example.
- *data*: Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*: The exposure of the analysis.

For further information about the function write *?g.dr.dicho* in r.









### Bibliography
- [1] James Robins. A new approach to causal inference in mortality studies with a sustained
exposure period--application to control of the healthy worker survivor effect (book review).
Mathematical Modelling, 7(9-12):1393-1512, 1986.
