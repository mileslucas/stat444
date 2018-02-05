###  Inverse CDF method to draw values of x from f(x) when we do not have
###  a closed form expression for the cdf.  The idea is to compute the
###  empirical cdf from evaluations of f(x) on a grid of values of x.

######################################################################
#  EXAMPLE 1
#  f(x) = 0.5(1 + x) for -1<x<1 and is 0 elsewhere.

x = seq(from=-0.999, to=0.999, length=1000)

#  We now evaluatef(x) for each value of x.
#  The vector p will contain the 1000 evaluations of f(x), for each of
#  the 1000 values of x in the grid.  In the final step, we normalize the elements of p by dividing each one
#  by the sum of all of them. This way, we ensure that the elements of p add up to
#  one.

p=seq(from=0, to=1, length=length(x))
for(i in 1:length(p)){
  p[i] = (1 + x[i]) / 2
}
p <- p/sum(p)

#  Here we compute the empirical cdf by adding the elements of p.  The
#  elements of cdf is what we called f in the notes.

cdf <- cumsum(p)

#  Draw M = 1000 uniform random variables and for each of them, 
#  check where they fall relative to the f values.  The vector icdf contains
#  5000 draws of xd from the density f(x).

u <- runif(1000)
icdf <- rep(0,length(u))
for (i in 1:length(u)) {
  icdf[i] <- x[1]
  for (j in 1:1000) {
    if (cdf[j] < u[i]) icdf[i] <- x[j]
  }
}
hist(icdf,freq=F)

################################################################
#  EXAMPLE 2
#  f(x) = exp(-0.5(log(x))^2)/(x sqrt(2pi)) for x >= 0.
#  This is a bit harder because we do not have a finite range of values of x
#  to construct the grid.  But for x = 50, we get a very low value of f(x)
#  so we will try the grid 0 to 50.  After trying with 50, it looks like the
#  prob of values above 20 is already minuscule.  So we go with 20.

x =  seq(from=0.001, to=20, length=1000)

p=seq(from=0, to=1, length=length(x))
lp = p 
for(i in 1:length(lp)){
  lp[i] = -(log(x[i]))^2 / 2 - log(x[i]*sqrt(2*3.14159))
}

p <- exp(lp - max(lp))
p <- p/sum(p)
cdf <- cumsum(p)


u <- runif(1000)
icdf <- rep(0,length(u))
for (i in 1:length(u)) {
  icdf[i] <- x[1]
  for (j in 1:1000) {
    if (cdf[j] < u[i]) icdf[i] <- x[j]
  }
}
hist(icdf,freq=F, breaks=25)




