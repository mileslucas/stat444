## Estimating the Poisson rate with a discrete prior ##
library(tidyverse)
library(tidyr)

# define the values of lambda and the associated probabilities

lambdas=seq(.5,3,by=.5)
prior=c(.1,.2,.3,.2,.15,.05)

# define the data (t and y)

t=6; y=12

# compute the posterior probabilities

like=exp(-t*lambdas)*(t*lambda)^y
post=prior*like/sum(prior*like)

output = data.frame("lambda" = lambdas, "prior" = prior, "like" = like/sum(like), "post" = post)
o.m = output %>% gather(key = "stage", value = "value", -lambda)
o.m$stage = factor(o.m$stage, levels = c("prior", "like", "post"))

ggplot(data = o.m, aes(x = lambda, y = value)) + geom_col() + facet_grid(stage~.) + scale_x_continuous(breaks = lambdas) + theme_bw()
# compute the predictive probability that there are no breakdowns


pred.lam=exp(-7*lambda)
pred.0.breakdowns=sum(post*pred.lam)
pred.0.breakdowns
