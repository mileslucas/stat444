# Point spread example.  Data are in file called
# footballscores in LearnBayes.
# We assume that the difference between observed game outcome and
# point spread is N(0, sigma^2).  We consider two different priors
# for sigma^2.

library(LearnBayes)
data(footballscores)
dim(footballscores)

outcome = footballscores$favorite - footballscores$underdog
d = outcome - footballscores$spread
n = length(d)

#Prior ~ N(0, sd = 5)
dprec = 1/169*n
pprec = 1/25

postmean = (dprec*mean(d) + pprec*0)/(dprec + pprec)
postvar = 1/(dprec + pprec)

hist(d, freq=F)
lines(seq(-25, 25, .1), dnorm(seq(-25,25,.1), mean = 0, sd = 5), col = "red")
lines(seq(-10, 10, .1), dnorm(seq(-10,10,.1), mean = postmean, sd = sqrt(postvar)), col = "black")

pnorm(0, mean = postmean, sd = sqrt(postvar))
s = seq(-3,3,.1)
plot(s, dnorm(s, postmean, sqrt(postvar)), type = "l")
abline(v = 0, col = "red")
