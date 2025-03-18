---
title: "Simple Linear Regression"
---


## Introduction

- Statistical model is quite important across a wide range of fields, providing researchers with tools for both explanation and prediction. 
- The most popular models of the statistical practice has been the general linear model (GLM). 
- The GLM finds the relation of a dependent and several independents variables that take form of tools as analysis of variance (ANOVA) and regression.


## Simple Linear Regression

- The simple linear regression model in population form is where $y_i$ is the dependent variable for individual $i$ in the data set and $x_i$ is the independent variable for subject $i$ ($i$ = 1, ..., $N$). 
- The terms $\beta_0$ dan $\beta_1$, are the intercept and slope of the model, respectively. 

$$
y_{ij}=\beta_{0j}+\beta_{1j}x+\varepsilon_{ij}
$$ {#eq-slr}

- The intercept is the point at which the line in @eq-slr crosses the $y$ axis at $x$ = 0. 
- Thus, larger values of $\beta_1$ (positive or negative) indicate a stronger linear relationship between $y$ and $x$.


## Random Error

- Random error, represented by $\varepsilon_i$, is inherent in any statistical model, including regression. 
- It expresses the fact that for any individual, $i$, the model will not generally provide a perfect predicted value of $y$, denoted $\hat{y}_i$ and obtained by applying the regression model as

$$
\hat{y}_i = \beta_0 + \beta_1x_i
$$ {#eq-re}

- Conceptually, this random error is representative of all factors that may influence the dependent variable other than $x$. 


## Estimating Regression with OLS

- Ordinary least squares (OLS) is popular methods for obtaining estimated values of the regression model parameters ($b_0$ and $b_1$, respectively) given a set of $x$ and $y$. 
- $\beta_0$ and $\beta_1$ must be estimated using sample data taken from the population. 
- The goal of OLS is to minimize the sum of the squared differences between the observed values of $y$ and the model-predicted values of $y$, across the sample. 
- This difference, known as the residual, is written as

$$
e_i = y_i - \hat{y}_i
$$ {#eq-diff}


- Therefore, the method OLS seeks to minimize

$$
\Sigma_{i=1}^n e_i^2 = \Sigma_{i=1}^n (y_i - \hat{y}_i)
$$ {#eq-ols}


## OLS Criteria

- It should be noted that in the context of simple linear regression, the OLS criteria reduce to the following equations, which can be used to obtain $b_0$ and $b_1$ as

$$
b_1 = r \left(\frac{S_y}{S_x} \right)
$$ {#eq-olsc1}

and

$$
b_0 = \overline{y} - b_1\overline{x}
$$ {#eq-olsc2}



## Example of Simple Regression

- In this example, we use the PISA 2022 data to analyze the impact of ESCS on the math achievement of Indonesian students. 
- The sample includes 1329 students who were assessed for both variables. 
- In this scenario, math achievement serves as the dependent variable, while ESCS is the independent variable. 
- Descriptive statistics for each variable, along with the correlations between them, are provided in Table 1.1.

## Descriptive stat


``` r
library(tidyverse)
```

``` output
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.0     ✔ stringr   1.5.1
✔ ggplot2   3.5.1     ✔ tibble    3.2.1
✔ lubridate 1.9.3     ✔ tidyr     1.3.1
✔ purrr     1.0.2     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```

``` r
library(gt)
library(psych)
```

``` output

Attaching package: 'psych'

The following objects are masked from 'package:ggplot2':

    %+%, alpha
```



``` r
library(tidyverse)
pisa_idn <- read_csv("data/pisa_idn_sample.csv") %>% 
  select(ESCS, MATH)
```

``` output
New names:
Rows: 1297 Columns: 9
── Column specification
──────────────────────────────────────────────────────── Delimiter: "," dbl
(9): ...1, CNTRYID, CNTSCHID, age, sex, ESCS, SES, MATH, growth
ℹ Use `spec()` to retrieve the full column specification for this data. ℹ
Specify the column types or set `show_col_types = FALSE` to quiet this message.
• `` -> `...1`
```

``` r
describe(pisa_idn)
```

``` output
     vars    n   mean    sd median trimmed   mad    min    max  range skew
ESCS    1 1297  -1.49  1.04  -1.56   -1.51  1.00  -4.63   1.52   6.15 0.18
MATH    2 1297 374.02 64.42 365.02  370.49 64.62 188.95 632.92 443.98 0.51
     kurtosis   se
ESCS    -0.34 0.03
MATH    -0.04 1.79
```


## Correlation


``` output
          ESCS      MATH
ESCS 1.0000000 0.2809688
MATH 0.2809688 1.0000000
```



``` r
Variable <- c("Math", "ESCS")
Mean <- c(367.28, -1.63)
Sd <- c(58.34, 0.99)
Correlation <- c(0.244, "")

table <- data.frame(Variable, Mean, Sd, Correlation)

table %>% 
  gt() %>%
  cols_label(
    Variable = md("**Variable**"),
    Mean = md("**Mean**"),
    Sd = md("**Standar Deviasi**"),
    Correlation = md("**Correlation**"))
```

<!--html_preserve--><div id="zsjfjdfaqq" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#zsjfjdfaqq table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#zsjfjdfaqq thead, #zsjfjdfaqq tbody, #zsjfjdfaqq tfoot, #zsjfjdfaqq tr, #zsjfjdfaqq td, #zsjfjdfaqq th {
  border-style: none;
}

#zsjfjdfaqq p {
  margin: 0;
  padding: 0;
}

#zsjfjdfaqq .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#zsjfjdfaqq .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#zsjfjdfaqq .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#zsjfjdfaqq .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#zsjfjdfaqq .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zsjfjdfaqq .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zsjfjdfaqq .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#zsjfjdfaqq .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#zsjfjdfaqq .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#zsjfjdfaqq .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#zsjfjdfaqq .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#zsjfjdfaqq .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#zsjfjdfaqq .gt_spanner_row {
  border-bottom-style: hidden;
}

#zsjfjdfaqq .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#zsjfjdfaqq .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#zsjfjdfaqq .gt_from_md > :first-child {
  margin-top: 0;
}

#zsjfjdfaqq .gt_from_md > :last-child {
  margin-bottom: 0;
}

#zsjfjdfaqq .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#zsjfjdfaqq .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#zsjfjdfaqq .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#zsjfjdfaqq .gt_row_group_first td {
  border-top-width: 2px;
}

#zsjfjdfaqq .gt_row_group_first th {
  border-top-width: 2px;
}

#zsjfjdfaqq .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zsjfjdfaqq .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#zsjfjdfaqq .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#zsjfjdfaqq .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zsjfjdfaqq .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#zsjfjdfaqq .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#zsjfjdfaqq .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#zsjfjdfaqq .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#zsjfjdfaqq .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#zsjfjdfaqq .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zsjfjdfaqq .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zsjfjdfaqq .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#zsjfjdfaqq .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#zsjfjdfaqq .gt_left {
  text-align: left;
}

#zsjfjdfaqq .gt_center {
  text-align: center;
}

#zsjfjdfaqq .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#zsjfjdfaqq .gt_font_normal {
  font-weight: normal;
}

#zsjfjdfaqq .gt_font_bold {
  font-weight: bold;
}

#zsjfjdfaqq .gt_font_italic {
  font-style: italic;
}

#zsjfjdfaqq .gt_super {
  font-size: 65%;
}

#zsjfjdfaqq .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#zsjfjdfaqq .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#zsjfjdfaqq .gt_indent_1 {
  text-indent: 5px;
}

#zsjfjdfaqq .gt_indent_2 {
  text-indent: 10px;
}

#zsjfjdfaqq .gt_indent_3 {
  text-indent: 15px;
}

#zsjfjdfaqq .gt_indent_4 {
  text-indent: 20px;
}

#zsjfjdfaqq .gt_indent_5 {
  text-indent: 25px;
}

#zsjfjdfaqq .katex-display {
  display: inline-flex !important;
  margin-bottom: 0.75em !important;
}

#zsjfjdfaqq div.Reactable > div.rt-table > div.rt-thead > div.rt-tr.rt-tr-group-header > div.rt-th-group:after {
  height: 0px !important;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Variable"><span class='gt_from_md'><strong>Variable</strong></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Mean"><span class='gt_from_md'><strong>Mean</strong></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Sd"><span class='gt_from_md'><strong>Standar Deviasi</strong></span></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Correlation"><span class='gt_from_md'><strong>Correlation</strong></span></th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="Variable" class="gt_row gt_left">Math</td>
<td headers="Mean" class="gt_row gt_right">367.28</td>
<td headers="Sd" class="gt_row gt_right">58.34</td>
<td headers="Correlation" class="gt_row gt_right">0.244</td></tr>
    <tr><td headers="Variable" class="gt_row gt_left">ESCS</td>
<td headers="Mean" class="gt_row gt_right">-1.63</td>
<td headers="Sd" class="gt_row gt_right">0.99</td>
<td headers="Correlation" class="gt_row gt_right"></td></tr>
  </tbody>
  
  
</table>
</div><!--/html_preserve-->

## Beta 1

- Using equations (1.4) and (1.5), we can use this information to obtain estimates for both the slope and the intercept of the regression model. 
- First, the slope of the regression is calculated as

$$
b_1 = 0.244 \left(\frac{58.34}{0.99} \right)=14.38
$$ {#eq-olsc1}

## Beta 0

- The results indicate that individuals with higher ESCS scores generally achieve higher math scores. - We can calculate an estimate of the intercept using the values in the table:

$$
b_0=367.28-(14.38)(-1.63)=390.72
$$

## Full model

- The resulting estimated regression equation for math and ESCS is:

$$
\hat {math}=390.72+14.38(ESCS).
$$

- This indicates that for a 1-point increase in ESCS score, math achievement would increase by 390.72 points.


## Measure the strength

- To assess the strength of the relationship between ESCS and math achievement, we should calculate the coefficient of determination. 
- This requires the values of $SS_R$ and $SS_T$. 
- The sum of squares due to regression ($SS_R$) or explained sum of squares (ESS) is the sum of the differences between the predicted value and the mean of the dependent variable. 

## Sum of squares due to regression 

- We can calculate the strength by this equation.

$$SS_R=\Sigma^n_{i=1}(\hat{y}_i-\bar{y})^2$$ 

- Where $\hat{y}_i$ is the predicted value of the dependent variable and $\bar{y}$ is mean of the dependent variable.



## Sum of squares error

- The sum of squares error ($SS_E$) or residual sum of squares is the difference between the observed and predicted values.

$$SS_E=\Sigma^n_{i=1}\varepsilon^2_i$$ 
Where $\varepsilon_i$ is the difference between the actual value of the dependent variable and the predicted value:

$$\varepsilon_i=y_i-\hat{y}_i$$

## Sum of squares total

- The sum of squares total ($SS_T$) or the total sum of squares (TSS) is the sum $SS_R$ and $SS_E$. 

$$SS_T=\Sigma^n_{i=1}(\hat{y}_i-\bar{y})^2 +\Sigma^n_{i=1}\varepsilon^2_i$$ 

## Regression in R

To simplify the calculation we will calculate the $R^2$ value using r. First, we create a regression model using the lm () function.


``` r
model <- lm(MATH ~ ESCS, data = pisa_idn)
```

## Calculate by hand

- We calculate the $SS_R$, $SS_E$, $SS_T$, $R^2$ value with the following command:


``` r
ssr <- sum((fitted(model)-mean(pisa_idn$MATH))^2)
ssr
```

``` output
[1] 424543.8
```

``` r
sse <- sum((fitted(model) - pisa_idn$MATH)^2)

sst <- ssr+sse
sst
```

``` output
[1] 5377820
```

## Calculate R square

$$
R^2=\frac{SS_R}{SS_T}= \frac{269424.3}{4520484}=0.06
$$

- The results indicate that about 6% of the difference in math achievement can be accounted for by the variance in ESCS scores. 

## Calculate F

- With this $R^2$ value, we can compute the F-statistic to test if any of the model slopes (in this instance, there is only one) are different from 0 in the population.

$$
F= (\frac {1329-1-1} {1})(\frac{0.06}{1-0.06})= 84.7
$$

















