#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| code-fold: true
#| code-summary: "Click here to see the data simulation & initial model code"

set.seed(9999)
n <- 500

x <- rnorm(n, 20, 2)
u <- runif(n, 0, 50)
beta1 <- 700
beta2 <- -2

## True model:
y <- beta1 + beta2 * I(x^2) + u

## Estimate a model of Y on X (so not the squared form)
model <- lm(y ~ x)

## Initial model summary
e <- model$residuals

knitr::kable(
  summary(model)$coefficients,
  digits = 3,
  col.names = c("Estimate", "Std. Error", "t value", "p-value")
)

#
#
#
#
#
#| label: fig-regression
#| code-fold: true
#| code-summary: "Click here to see the plotting code"
#| layout-ncol: 2
#| fig-width: 5
#| fig-height: 4
#| fig-cap: "A regression and a diagnostic graph"
#| fig-subcap:
#|   - "True DGP vs estimated regression (red)"
#|   - "Regressor vs residuals"

## Plot 1: Data and linear fit
plot(x, y)
abline(model, col = "red")

## Plot 2: Residuals vs regressor
plot(x, e)
#
#
#
#
#
#
#
#
#
#
#| code-fold: true
#| code-summary: "Click here to see the code for the diagnostic regression"


## Regress residuals on a squared form of demeaned x
x_dm2 <- I((x - mean(x))^2)
model2 <- lm(e ~ x_dm2)

knitr::kable(
  summary(model2)$coefficients,
  digits = 3,
  col.names = c("Estimate", "Std. Error", "t value", "p-value")
)

#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
