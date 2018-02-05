#########################################################################
# Exercise 2
# Estimating a proportion and prediction of a future sample
########################################################################

# Define the parameters of the beta posterior

a=23; b=8
s = seq(0,1,length.out = 1000)
qplot(x = s, y = dbeta(s, a, b), geom = "line", xlab = "theta", ylab = "Beta(a, b)")

# Use the qbeta function to construct a 90% interval estimate

interval.est=qbeta(c(.05,.95),a,b)
interval.est

qplot(x = s, y = dbeta(s, a, b), geom = "line", xlab = "theta", ylab = "Beta(a, b)") + geom_vline(aes(xintercept = interval.est), col = "red")

# Find P(p > .6) by use of the pbeta function

prob=1-pbeta(.6,a,b)
prob
qplot(x = s, y = dbeta(s, a, b), geom = "line", xlab = "theta", ylab = "Beta(a, b)") + geom_vline(xintercept = .6, col= "red")

# Simulate 1000 draws from the beta(a, b) distribution

sim.p=rbeta(1000,a,b)
qplot(x = sim.p, geom= "histogram", bins = 30) + coord_cartesian(xlim = c(0,1))
qplot(x = sim.p, y = ..density.., geom= "histogram", bins = 30) + geom_line(aes(x = s, y = dbeta(s, a, b)), col = "red")

# Simulate 1000 draws from the posterior predictive distribution

sim.y=rbinom(1000,10,sim.p)
qplot(sim.y, geom = "bar") + coord_cartesian(xlim = c(0, 10)) + scale_x_continuous(breaks = 0:10, labels=as.character(0:10)) + ggtitle("Predicted # of grads")

# Tabulate the predictive distribution

table(sim.y)
#table(factor(sim.y, levels = 0:10))

# Compute the predictive probability that 9 or 10 will graduate
# by inspection, you compute this probability from the table.  Or do

prob1 = sum(sim.y >= 9)/1000
prob1

# Compute the probability of observing between 4 and 8 graduates.
prob2 = (sum(sim.y <= 8) - sum(sim.y <= 4))/1000
prob2

# Summarize the posterior predictive distribution of the number of
# among 10 future students.
summary(sim.y)
quantile(0,.05,.25,.5,.75,.95,1)
