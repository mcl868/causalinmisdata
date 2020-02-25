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

Robins [1] defines the g-formula given by

<a href="https://www.codecogs.com/eqnedit.php?latex=E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_T=\overline{a}_T,&space;\overline{L}_T=\overline{l}_T)&space;\prod_{t=0}^Tf_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t." target="_blank"><img src="https://latex.codecogs.com/gif.latex?E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}}&space;E(Y\mid&space;\overline{A}_T=\overline{a}_T,&space;\overline{L}_T=\overline{l}_T)&space;\prod_{t=0}^Tf_{L_t\mid&space;\overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid&space;\overline{l}_{t-1},\overline{a}_{t-1})&space;d\overline{l}_t." title="E\left(Y^{\overline{a}_T}\right)=\int_{\mathcal{L}} E(Y\mid \overline{A}_T=\overline{a}_T, \overline{L}_T=\overline{l}_T) \prod_{t=0}^Tf_{L_t\mid \overline{L}_{t-1},\overline{A}_{t-1}}(l_t\mid \overline{l}_{t-1},\overline{a}_{t-1}) d\overline{l}_t." /></a>

## The package contains following functions
- g.dicho
- seq.mediator
- missing.pattern
- prob.of.missing
- g.dr.dicho
- seq.dr.mediator
- monotone.pattern

### g.dicho
The estimator for the g-formula for binary exposures and continuous outcomes
```markdown
g.dicho(mmodels,
        exposure,
        data, ...)
```
**Input**
- *mmodels*:  Models corresponding to response.
- *exposure*: The time-varying exposure.
- *data*:     Data.

**Output**
- *coef*:           The coefficients in marginal strucktural model.
- *ExpectEstimate*: The expected value of the potential outcome.
- *mmodels*:        The mmodels that have been used for modeling data.
- *exposure*:       The exposure of the analysis.
- *N*:              The sample size of data.
- *NCC*:            The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.

For further information about the function write *?g.dicho* in R.


### seq.mediator
The estimator for sequential mediation for binary exposures and continuous outcomes
```markdown
seq.mediator(mmodels,
             exposure,
             int,
             data, ...)
```
**Input**
- *mmodels*:  Models corresponding to response.
- *exposure*: The time-varying exposure.
- *int*:      The exposure of interest for the mediation analysis.
- *data*:     Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *coef*:     The coefficients from the analysis of the direct effect and the indirect effects.
- *exposure*: The exposure of the analysis.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.

For further information about the function write *?seq.mediator* in R.


### missing.pattern
```markdown
missing.pattern(response,
                covariates,
                data, ...)
```
**Input**
- *response*:   The outcome variable of the interest.
- *covariates*: The ordered sequence of the variables of the interest without the response.
- *data*:       The data.

**Output**
- *data*:          The data of the chosen pattern of missingness (used in the function **prob.of.missing**).
- *covariatesObj*: The ordered sequence of the variables of the interest (used in the function **prob.of.missing**).
- *responseObj*:   The outcome variable of the interest (used in the function **prob.of.missing**).
- *count*:         The number of the observed variables in integers.
- *percent*:       The percent of the observed variables.

For further information about the function write *?missing.pattern* in R.


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
- *list.out*:     If it is equal to TRUE then output is a list, see **Output**.
If it is equal to FALSE then output is only data.
- *completecase*: If it is equal to TRUE then data.frame is only complete cases.
- *regList*:      The list consist of the models to estimate the probabilities for the missingness in data.
- *order*:        The order of measurement in data.

**Output**
- *regList*:  The regression models that been used to obtain lambda (exist *if list.out is equal to TRUE*).
- *CoefList*: The coefficients form the regression models (exist *if list.out is equal to TRUE*).
- *count*:    The numbers of the observed variables in integers (exist *if list.out is equal to TRUE*).
- *percent*:  The percent of the observed variables (exist *if list.out is equal to TRUE*).
- *data*:     The data of the chosen pattern of missingness ssh (exist *if list.out is equal to TRUE of FALSE*).

For further information about the function write *?prob.of.missing* in R.


### g.dr.dicho
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
- *mmodels*:    Models corresponding to response.
- *exposure*:   The time-varying exposure.
- *covariates*: The ordered sequence of the variables of the interest without the response.
- *regList*:    The list consist of the models to estimate the probabilities for the missingness in data.
See the function **missing.pattern**.
- *augList*:    The list consist of the models of the Augmentations space.
All the models are linear by default (*augList=NULL*)
- *data*:       Data.

**Output**
- *ExpectEstimate*: The expected value of the potential outcome.
- *coef*:           The coefficients in marginal strucktural model.
- *mmodels*:        The mmodels that have been used for modeling data.
- *N*:              The sample size of data.
- *NCC*:            The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*:       The exposure of the analysis.
- *augList*:    The list consist of the models of the Augmentations space.
All the models are linear by default (*augList=NULL*)

For further information about the function write *?g.dr.dicho* in r.


### seq.dr.mediator
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
- *mmodels*:    Models corresponding to response.
- *exposure*:   The time-varying exposure.
- *int*:        The exposure of interest for the mediation analysis.
- *covariates*: The ordered sequence of the variables of the interest without the response.
- *regList*:    The list consist of the models to estimate the probabilities for the missingness in data.
See the function **missing.pattern**.
- *augList*:    The list consist of the models of the Augmentations space.
All the models are linear by default (*augList=NULL*)
- *data*:       Data.

**Output**
- *coef*:     The coefficients from the analysis of the direct effect and the indirect effects.
- *mmodels*:  The mmodels that have been used for modeling data.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*: The exposure of the analysis.
- *regList*:    The list consist of the models to estimate the probabilities for the missingness in data.
See the function **missing.pattern**.
- *augList*:  The list consist of the models of the Augmentations space.
- *count*:    The number of the observed variables in integers.
- *CoefList*: The coefficients form the regression models (exist *if list.out is equal to TRUE*).

For further information about the function write *?seq.dr.mediator* in r.

### monotone.pattern
The estimator for sequential mediation for binary exposures and continuous outcomes with data
with missing observations following a monotone pattern
```markdown
monotone.pattern(measurements,
                 data,
                 id=NULL,
                 transform=TRUE,
                 threshold=0.05, ...)
```

**Input**
- *measurements*: The ordered sequence of the variables of the interest including the outcome.
- *data*:         Data.
- *id*:           If data variable of id.
- *transform*:    *If it is equal to TRUE* then all records following a nonmontone are set
to follow a monotone pattern.
*If it is equal to FALSE* then all records following a nonmontone are remain the same.
- *threshold*:    Remove pattern of from the monoene missingness if the percent of specific records
is below the threshold.

**Output**
- *data*:              Data.
- *transformnb*:       Contain the position of the record in data if the record follows a nonmontone
pattern. (If *transform=TRUE*).
- *tableC*:            The number of the observed variables in integers. See the function **missing.pattern**.
(If *transform=TRUE*).
- *tableCpercent*:     The percent of the observed variables.
(If *transform=TRUE*).
- *threshold*:         The value of the threshold.
(If *transform=TRUE*).
- *datasetredu*:       The records are removed from data if there are to few records of a specific pattern
below the threshold.
(If *transform=TRUE*).
- *tableCredu*:        The number of the observed variables in integers for the reduced data.
See the function **missing.pattern**. (If *transform=TRUE*).
- *tableCpercentredu*: The percent of the observed variables for the reduced data.
(If *transform=TRUE*).
- *nonmonotone*:       Contain the position of the record in data if the record follows a nonmontone
pattern. (If *transform=FALSE*)

For further information about the function write *?monotone.pattern* in r.

## Example with three exposures in the presence of time-dependent confounding





### Bibliography
- [1] James Robins. A new approach to causal inference in mortality studies with a sustained
exposure period--application to control of the healthy worker survivor effect (book review).
Mathematical Modelling, 7(9-12):1393-1512, 1986.
