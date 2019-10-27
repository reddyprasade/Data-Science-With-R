# Example 1
p <- 0.5
q <- seq(0,100,1)
y <- p*q
plot(q,y,type='l',col='red',main='Linear relationship')

# Example 2
y <- 450 + p*(q-10)^3
plot(q,y,type='l',col='navy',main='Nonlinear relationship',lwd=3)

#-------------------------------------------------------------------------------
# Polynomial Regression

# Always remember use to set.seed(n) when generating pseudo random numbers.
# By doing this, the random number generator generates always the same numbers.
set.seed(20)

# Predictor (q). Use seq for generating equally spaced sequences fast
q <- seq(from=0, to=20, by=0.2)

# Value to predict (y)
y <- 500 + 0.4 * (q-10)^3

# Some noise is generated and added to the real signal (y)
noise <- rnorm(length(q), mean=10, sd=80)
noisy.y <- y + noise

# Plot of the noisy signal
plot(q,noisy.y,col='deepskyblue4',xlab='q',main='Observed data')
lines(q,y,col='firebrick1',lwd=3)

model <- lm(noisy.y ~ poly(q,3))
summary(model)

# Uncomment the next line to check residual plots and other model plots
plot(model)

# Confidence intervales for model parameters
confint(model, level=0.95)

# Plot of fitted vs residuals
# No clear pattern should show in the residual plot if the model is a good fit
plot(fitted(model),residuals(model))

# Predicted values and confidence intervals
predicted.intervals <- predict(model,data.frame(x=q),interval='confidence', level=0.99)

# Add lines to the existing plot
lines(q,predicted.intervals[,1],col='green',lwd=3)
lines(q,predicted.intervals[,2],col='black',lwd=1)
lines(q,predicted.intervals[,3],col='black',lwd=1)

# Add a legend
legend("bottomright",c("Observ.","Signal","Predicted"), 
       col=c("deepskyblue4","red","green"), lwd=3)

