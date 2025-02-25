---
title: "Random Intercept"
---

## Random Intercept

-   The intercept in a simple regression model represents the average value of $y$ when $x$ is 0.
-   In a simple regression model, there is one intercept for all individuals in the study population.
-   However, when individuals are grouped, such as in classes, schools, or firms, there is the potential for separate intercepts for each group.

## More visual

![](/img/random_intercept.png)

## Equation Level 1

The equation for a level 1 regression model in multilevel modeling is:

$$
y_{ij}=\beta_{0j}+\beta_{1j}x+\varepsilon_ij
$$

where $ij$ declare the individual $i$ and group $j$.

## Random Intercept for Group

Random intercept for each group:

$$
y_{ij}=\beta_{0j}+\varepsilon_{ij}
$$

## Random Intercept Equation

Random intercept:

$$
\beta_{0j}=\gamma_{00}+U_{0j}
$$ $\gamma_{00}$ represents the average intercept value across all clusters, while $U_{0j}$ represents the group-specific effect on the intercept. When the clusters are assumed to be random, $U_{0j}$ can be described as the residual effect on $y_{ij}$.

## Full Composite Model

If both random intercept equations are substituted into the regression model equation, we obtain the full or composite model.

$$
y=\gamma_{00}+U_{0j}+\beta_1x+\varepsilon
$$
