# causalinmisdata

[Go back to homepage](https://mcl868.github.io/)

To install the package from GitHub:
```markdown
install.packages("devtools")
devtools::install_github("mcl868/causalinmisdata")
```
If the package *devtools* is already installed then it is **not** nessecary to use the command
*install.packages("devtools")*.

This package require addtional packages
[HelpPackage](https://github.com/mcl868/HelpPackage/blob/master/README.md)
and
[gtools](https://cran.r-project.org/web/packages/gtools/index.html)
for further information

## This package contains following functions

### For binary exposure
- [g.aipw.dicho](https://github.com/mcl868/packagedevelop/blob/master/README.md#gaipwdicho)
- [missing.pattern](https://github.com/mcl868/packagedevelop/blob/master/README.md#missingpattern)
- [prob.of.missing](https://github.com/mcl868/packagedevelop/blob/master/README.md#probofmissing)
- [g.aipwcc.dicho](https://github.com/mcl868/packagedevelop/blob/master/README.md#gaipwccdicho)

Look at the [example](https://github.com/mcl868/packagedevelop/blob/master/README.md#example) to see how to use
**g.aipw.dicho**. The example have a DAG with three binary exposure and time-depending confounding.
The example is extended data with variable with missing values.


## g.aipw.dicho
Augmeneted inverse probability weighted (AIPW) function for binary exposures and continuous outcomes
```markdown
g.aipw.dicho(mmodels,
             pmodels,
             data,...)
```

**Input**
- *mmodels*: Models corresponding to response. See example.
- *pmodels*: Models for the probability of receive a certain treatment. See example.
- *data*: Data.

**Output**
- *mmodels*:  The mmodels that have been used for modeling data.
- *pmodels*:  The pmodels that have been used for modeling data.
- *N*:        The sample size of data.
- *NCC*:      The sample size of complete cases of data. In case of no missing values *NCC* is equal to *N*.
- *exposure*: The exposure of the analysis.

For further information about the function write *?g.aipw.dicho* in r.

## Example
### DAG
<img src="https://user-images.githubusercontent.com/20704019/52327724-60d3ec00-29ed-11e9-86fd-e4fa37fa1bd7.PNG" width="480">

Assume to 3 binary exposures
<a href="https://www.codecogs.com/eqnedit.php?latex=A_i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?A_i" title="A_i" /></a>
and continuous outcome
<a href="https://www.codecogs.com/eqnedit.php?latex=Y" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Y" title="Y" /></a>.
Let
<a href="https://www.codecogs.com/eqnedit.php?latex=L_i" target="_blank"><img src="https://latex.codecogs.com/gif.latex?L_i" title="L_i" /></a>
be time-depending confounding for
<a href="https://www.codecogs.com/eqnedit.php?latex=i=0,...,2" target="_blank"><img src="https://latex.codecogs.com/gif.latex?i=0,...,2" title="i=0,...,2" /></a>.

<a href="https://www.codecogs.com/eqnedit.php?latex=\\L_0:=\varepsilon\\&space;A_0:=p(0.6L_0)\\&space;L_1:=-A_0&plus;0.2L_0-A_0L_0&plus;\varepsilon\\&space;A_1:=p(-1&plus;1.6A_0&plus;1.2L_1-0.8L_0-1.6L_1A_0)\\&space;L_2:=A_1&plus;L_1-A_0&plus;1.2L_0&plus;\varepsilon\\&space;A_2:=p(1-0.8L_0&plus;1.6A_0&plus;1.2L_1&plus;1.3A_1&plus;0.5L_2&plus;1.6L_1A_1)\\&space;Y:=2L_0&plus;3A_0&plus;L_1&plus;2A_1-2L_2&plus;A_2&plus;L_2A_2&plus;\varepsilon\\" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\\L_0:=\varepsilon\\&space;A_0:=p(0.6L_0)\\&space;L_1:=-A_0&plus;0.2L_0-A_0L_0&plus;\varepsilon\\&space;A_1:=p(-1&plus;1.6A_0&plus;1.2L_1-0.8L_0-1.6L_1A_0)\\&space;L_2:=A_1&plus;L_1-A_0&plus;1.2L_0&plus;\varepsilon\\&space;A_2:=p(1-0.8L_0&plus;1.6A_0&plus;1.2L_1&plus;1.3A_1&plus;0.5L_2&plus;1.6L_1A_1)\\&space;Y:=2L_0&plus;3A_0&plus;L_1&plus;2A_1-2L_2&plus;A_2&plus;L_2A_2&plus;\varepsilon\\" title="\\L_0:=\varepsilon\\ A_0:=p(0.6L_0)\\ L_1:=-A_0+0.2L_0-A_0L_0+\varepsilon\\ A_1:=p(-1+1.6A_0+1.2L_1-0.8L_0-1.6L_1A_0)\\ L_2:=A_1+L_1-A_0+1.2L_0+\varepsilon\\ A_2:=p(1-0.8L_0+1.6A_0+1.2L_1+1.3A_1+0.5L_2+1.6L_1A_1)\\ Y:=2L_0+3A_0+L_1+2A_1-2L_2+A_2+L_2A_2+\varepsilon\\" /></a>
where
<a href="https://www.codecogs.com/eqnedit.php?latex=\varepsilon\sim" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\varepsilon\sim" title="\varepsilon\sim" /></a>



#### Data
```markdown
p<-function(x)exp(x)/(1+exp(x))

loop<-2000
NN<-1000

set.seed(3)
DataSetList<-list()
for(iiii in 1:loop){
  L0<-rnorm(NN)
  A0<-1*(runif(NN,0,1)<=p(0.6*L0))

  L1<--A0+0.2*L0-1*A0*L0+rnorm(NN)
  A1<-1*(runif(NN,0,1)<=p(-1+1.6*A0+1.2*L1-0.8*L0-1.6*L1*A0))

  L2<--A1+1*L1-A0+1.2*L0+rnorm(NN)
  A2<-1*(runif(NN,0,1)<=p(1-0.8*L0+1.6*A0+1.2*L1+1.3*A1+0.5*L2+1.6*L1*A1))

  Y<-2*L0+3*A0+1*L1+2*A1-2*L2+5*A2+L2*A2+rnorm(NN)

  DataSetList[[iiii]]<-data.frame(L0, L1, L2, A0, A1, A2, Y);rm(list=c("L0","L1","L2","A0","A1","A2","Y"))}
rm("iiii")
```


![a_1]

#### bla
```markdown
pi1 <- A0 ~ L0
pi2 <- A1 ~ L0 + A0 + L1 + L1*A0
pi3 <- A2 ~ L0 + A0 + L1 + A1 + L2 + L1*A1

model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- model1 ~ A1 + L1 + A0 + L0
model3 <- model2 ~ A0 + L0 + A0*L0

estimation<-list()
for(iiii in 1:loop){
  estimation[[iiii]]<-g.aipw.dicho(mmodels=c(model1,model2,model3),
                                   pmodels=c(pi1,pi2,pi3),
                                   data=DataSetList[[iiii]])}
```

#### bla
```markdown
pi1 <- A0 ~ L0
pi2 <- A1 ~ L0 + A0 + L1 + L1*A0
pi3 <- A2 ~ L0 + A0 + L1 + A1 + L2 + L1*A1

model1 <- Y ~ L0 + A0 + L1 + A1 + L2 + A2 + L2*A2
model2 <- model1 ~ A1 + L1 + A0 + L0
model3 <- model2 ~ A0 + L0 + A0*L0

estimation<-list()
for(iiii in 1:loop){
  estimation[[iiii]]<-g.aipw.dicho(mmodels=c(model1,model2,model3),
                                   pmodels=c(pi1,pi2,pi3),
                                   data=DataSetList[[iiii]])}
```

### missing.pattern
```markdown
missing.pattern(response,
                covariates,
                data,
                pattern, ...)
```

**Input**
- *response*:   The outcome variable of interest.
- *covariates*: The order of the variables of interest.
- *data*:       The data.
- *pattern*:    The two different pattern of missingness *two level* or *monotone*.

**Output**
- *data*:          The data of the choosen pattern of missingness (used in the function **prob.of.missing**).
- *covariatesObj*: The order of the variables of interest (used in the function **prob.of.missing**).
- *pattern*:       The choosen pattern of missingness either *two level* or *monotone* (used in the function **prob.of.missing**).
- *responseObj*:   The outcome variable of interest (used in the function **prob.of.missing**).
- *count*:         The number of the observed variables in integers.
- *percent*:       The precent of the observed variables.

### Missing data
```markdown
DataSetListNA<-list()
for(iiii in 1:loop){
  REMOVE1<-with(DataSetList[[iiii]],1*(runif(nrow(DataSetList[[iiii]]),0,1)<=p(-2.2-0.5*L0)))
  updata1<-DataSetList[[iiii]][REMOVE1==1,];upd1<-DataSetList[[iiii]][REMOVE1==0,]
  updata1[,c("A0","L1","A1","L2","A2","Y")]<-NA

  REMOVE2<-with(upd1,1*(runif(nrow(upd1),0,1)<=p(-2.3+0.2*L0-0.2*A0)))
  updata2<-upd1[REMOVE2==1,];upd2<-upd1[REMOVE2==0,]
  updata2[,c("L1","A1","L2","A2","Y")]<-NA

  REMOVE3<-with(upd2,1*(runif(nrow(upd2),0,1)<=p(-2.4-0.3*L0+0.2*A0-0.2*L1)))
  updata3<-upd2[REMOVE3==1,];upd3<-upd2[REMOVE3==0,]
  updata3[,c("A1","L2","A2","Y")]<-NA

  REMOVE4<-with(upd3,1*(runif(nrow(upd3),0,1)<=p(-2.3+0.4*L0+0.2*A0+0.8*L1+0.5*A1)))
  updata4<-upd3[REMOVE4==1,];upd4<-upd3[REMOVE4==0,]
  updata4[,c("L2","A2","Y")]<-NA

  REMOVE5<-with(upd4,1*(runif(nrow(upd4),0,1)<=p(-2.2+0.4*L0+0.2*A0+0.7*L1+0.5*A1-0.3*L2)))
  updata5<-upd4[REMOVE5==1,];upd5<-upd4[REMOVE5==0,]
  updata5[,c("A2","Y")]<-NA

  REMOVE6<-with(upd5,1*(runif(nrow(upd5),0,1)<=p(-2+0.4*L0+0.2*A0+0.7*L1-0.5*A1-0.3*L2+1.2*A2-1.4*A1*A2)))
  updata6<-upd5[REMOVE6==1,];updata7<-upd5[REMOVE6==0,]
  updata6[,c("Y")]<-NA

  DataSetListNA[[iiii]]<-rbind(updata1,updata2,updata3,updata4,updata5,updata6,updata7)[sample(1:NN,NN),]}
```

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
- *pattern*:  The choosen pattern of missingness either *two level* or *monotone* (exist *if list.out is equal to TRUE*).
- *regList*:  The regression models that been used to obtain lambda (exist *if list.out is equal to TRUE*).
- *CoefList*: The coefficients form the regression models (exist *if list.out is equal to TRUE*).
- *count*:    The numbers of the observed variables in integers (exist *if list.out is equal to TRUE*).
- *percent*:  The percent of the observed variables (exist *if list.out is equal to TRUE*).


#### bla
```markdown  
estimationNA<-list()
for(iiii in 1:loop){
  estimationNA[[iiii]]<-g.aipw.dicho(mmodels=c(model1,model2,model3),
                                     pmodels=c(pi1,pi2,pi3),
                                     data=DataSetListNA[[iiii]])}

regList<-list()
regList[[1]]<-"L0"
regList[[2]]<-"L0 + A0"
regList[[3]]<-"L0 + A0 + L1"
regList[[4]]<-"L0 + A0 + L1 + A1"
regList[[5]]<-"L0 + A0 + L1 + A1 + L2"
regList[[6]]<-"L0 + A0 + L1 + A1 + L2 + A2 + A1*A2"

DataSetCount<-list()
CountList<-Coef1List<-Coef2List<-Coef3List<-Coef4List<-Coef5List<-Coef6List<-list()
for(iiii in 1:loop){
  misdata<-missing.pattern(response = "Y",
                           covariates = c("L0","A0","L1","A1","L2","A2"),
                           data = DataSetListNA[[iiii]],
                           pattern = "Monotone")

  DataSetobj<-prob.of.missing(misdata, regList = regList)

  DataSetCount[[iiii]]<-misdata$count
  Coef1List[[iiii]]<-DataSetobj$CoefList[[1]]
  Coef2List[[iiii]]<-DataSetobj$CoefList[[2]]
  Coef3List[[iiii]]<-DataSetobj$CoefList[[3]]
  Coef4List[[iiii]]<-DataSetobj$CoefList[[4]]
  Coef5List[[iiii]]<-DataSetobj$CoefList[[5]]
  Coef6List[[iiii]]<-DataSetobj$CoefList[[6]]}

listMean(DataSetCount)
       1        2        3        4        5        6      Inf
217.2500 151.9170 172.9670 161.1325 203.7540 176.3445 916.6350

round(listMean(Coef1List),1)
(Intercept)          L0
       -2.2        -0.5
round(listMean(Coef2List),1)
(Intercept)          L0          A0
       -2.3         0.2        -0.2
round(listMean(Coef3List),1)
(Intercept)          L0          A0          L1
       -2.4        -0.3         0.2        -0.2
round(listMean(Coef4List),1)
(Intercept)          L0          A0          L1          A1
       -2.3         0.4         0.2         0.8         0.5
round(listMean(Coef5List),1)
(Intercept)          L0          A0          L1          A1          L2
       -2.2         0.4         0.2         0.7         0.5        -0.3
round(listMean(Coef6List),1)
(Intercept)          L0          A0          L1          A1          L2          A2       A1:A2
       -2.0         0.4         0.2         0.7        -0.5        -0.3         1.2        -1.4

```

## g.aipwcc.dicho
```markdown
g.aipwcc.dicho(mmodels,
               pmodels,
               covariates,
               pattern,
               regList,
               data,
               aug = NULL,...)}
```
**Input**
- *mmodels*: models bla
- *pmodels*: models bla
- *covariates*: data bla
- *pattern*: bla
- *regList*: bla
- *data*: bla
- *aug*: bla

**Output**
- *bla*
- *bla*
- *bla*

### Missing estimation
```markdown
estimationMis<-list()
for(iiii in 1:loop){
  estimationMis[[iiii]]<-g.aipwcc.dicho(mmodels=c(model1,model2,model3),
                                        pmodels=c(pi1,pi2,pi3),
                                        data=DataSetList[[iiii]],
                                        covariates=c("L0","A0","L1","A1","L2","A2"),
                                        pattern = "Monotone",
                                        regList=regList)}
```
