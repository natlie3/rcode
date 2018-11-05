cricket<- read_excel("C:\\Users\\Owner\\Documents\\Rdata\\cricket_data.xlsx")

#column names
names(cricket)


cricket<- as.data.frame(cricket)
str(cricket)


# create a dependent variable for the y-axis, set it equal to the first column of cricket
yi.chirps<- cricket[,1]

# create an independent variable for the x-axis, set it equal to the second column of cricket
xi.temp<- cricket[, 2]

# plot takes inputs in the form of plot(x, y), cex.axis and cex.lab scale the font sizes by a
#factor relative to the default


df=as.data.frame( xi.temp,yi.chirps)
plot(yi.chirps, xi.temp, xlab = "air temperature, F", ylab = "number of cricket chirps/second", cex.axis = 1.5, cex.lab = 1.5)



# lm is the linear model function, which takes a formula argument in the form of: dependent ~ independent

# saving the model to cricketfit saves a lot of information about the model, which can be accessed with 
#other functions

cricketfit <- lm(formula = yi.chirps ~ xi.temp)


# abline plots the line from a linear model output on the most recent graph

# abline can also be used to plot any line using two arguments, a y-intercept and a slope

abline(cricketfit)



# the summary function applied to a linear model output returns a lot of information about the model,
#shown below:

summary(cricketfit)


# the coefficients function returns the y-intercept and the other coefficients in the linear model. In the case of simple linear regression, 
#the only other coefficient is the slope.
coefficients(cricketfit)


## The confint function returns the range confidence interval estimate for the coefficients shown above. In this case, we specified a 
#confidence level of 0.95

confint(cricketfit, level = 0.95)




## fitted returns the predicted values for the dependent variable for a given set of values of the independent variable
#(specified by the vector xi.temp)
fitted(cricketfit)


# residuals returns the vector of residuals for each data point relative to the calculated linear model
residuals(cricketfit)


## Finally, cor returns the correlation coefficient between two vectors. We will see shortly that it also works on more than two variables, 
#resulting in a correlation matrix
cor(xi.temp,yi.chirps)

plot(cricketfit, cex.lab = 1.5, cex.axis = 1.5)






