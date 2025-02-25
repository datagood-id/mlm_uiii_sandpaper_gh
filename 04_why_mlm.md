---
title: "Why Multilevel Model?"
---

## Motivation

1. This nested structure can tell us important things about the social world. Knowing how much variation we have at each level can inform policy and theory.

2. Multilevel models allow us to estimate these different sources of variation.

## More visual explanation


![](../img/ses_ach.png)
- The relationship between SES and ACH would be different if we use multilevel model relative or linear regression.


## Nested Data and Cluster Sampling Designs

- Nested data defined as a data that contains one  more other structures of the same or different type
- Individual data points at one level (e.g. student) appear in only one level of a higher-level variable such as school. 
- Thus, students are nested within school.
- Another example where employees group by division in the company. 

## Illustration of Nested Structure

![](../img/multilevel-model2_col_sep.png)

## The application

- [Educational Psychology](https://www.sciencedirect.com/science/article/abs/pii/S0022440524000013)
- [Educational management](https://journals.sagepub.com/doi/full/10.1177/1741143220968170)
- [Political science](https://journals.sagepub.com/doi/abs/10.1177/19401612221117106)
- [Organisional Behavior](https://www.emerald.com/insight/content/doi/10.1108/LODJ-04-2022-0175/full/html)


## Intraclass Correlation

- Intraclass correlation (ICC) is the ratio of the variance between groups to the total variance denoted by ${\rho}_1$ in the population. 
- ICC ranges from 0 (no variance between clusters) to 1 (there is variance between clusters but no variance within clusters). Mathematically, ICC can be formulated as follows. cluster variance).

## The Concept of ICC

$\rho_I$ can also be conceptualized as the correlation for the dependent measure for two individuals randomly selected from the same cluster. It can be expressed as:



$$
\rho_I = \frac {\tau^2}{\tau^2 + \sigma^2}
$$

where
$\tau^2$ = Population variance between clusters
$\sigma^2$ = Population variance within clusters


## The Concept of ICC

- The ICC is an important tool in multilevel modeling, in large part because it is an indicator of the degree to which the multilevel data structure might impact the outcome variable of interest.


- The higher the ICC value, the more diversity there is between groups/clusters.



## Pitfalls of Ignoring Multilevel Data Structure (1)


- When performing multilevel modeling, violations of the assumption of independent errors may occur. For example, the math achievement scores of students who attend the same school will be more correlated than the scores of students who attend different schools. 
- This may be because students in the same school have the same teachers, curriculum, and community, or for other reasons. 

- Correlation within schools will result in inaccurate estimates of standard errors for the model parameters, which in turn can lead to statistical inference errors, such as p-values that are smaller than they should be and result in Type 1 errors.

## Pitfalls of Ignoring Multilevel Data Structure (2)

- In addition, we may miss important relationships involving each level in the data. As in our example, there are two sampling levels: students (level 1) nested within schools (level 2). 
- Specifically, by not including information about schools, for example, we may miss important variables at the school level that help explain students’ math performance. 
- In the context of MLM, including variables at each level is relatively straightforward, as are interactions among variables at different levels. 
- This greater model complexity can in turn lead to a better understanding of the phenomena being studied.




## Null Model

In MLM, analysis often begins with a null model, which can be denoted as follows. The null model is used as a basis for model building and as a model comparison.

$$
y_{ij}=\gamma_{00}+U_{0j}+\varepsilon_{ij}
$$













