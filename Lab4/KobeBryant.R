


kobe = read.csv("/Users/Nick/Documents/Teaching/Stat444_S18/Labs/Lab4/KobeBryantStats.csv")

FG = kobe$FG[-dim(kobe)[1]]
FGA = kobe$FGA[-dim(kobe)[1]]

#  We will use the variables FGM and FGA:  field goals made and field
#  goals attempted.  FGM is a binomial random variable with some probability
#  theta and n = FGA.  We use a noninformative prior, and will investigate
#  whether Bryant is still improving his game.

postind = matrix(NA, ncol = 20, nrow = 1000)

for(i in 1:20){
  a = FG[i]+1
  b = FGA[i]-FG[i]+1
  for(j in 1:1000)
    postind[j,i] = rbeta(1, a, b)
}
colnames(postind) = as.character(kobe$Season[1:20])
library(tidyr)
library(tidyverse)
postind.m = as.data.frame(postind) %>% gather(key = "year")
qplot(data = postind.m, x = value, col = year, geom = "density")  + scale_color_discrete(h = c(98, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1, na.value = "grey50") + coord_cartesian(xlim = c(.28,.6))

cumFG = cumsum(FG)
cumFGA = cumsum(FGA)

post = matrix(NA, nrow=1000, ncol=20)

#  The ith col of post contains 1000 draws from the posterior distribution that is beta
#  with parameters a = cumy[i]+1 and b = cumn[i]-cumy[i]+1.
for(i in 1:20){
  a = cumFG[i]+1
  b = cumFGA[i]-cumFG[i]+1
  for(j in 1:1000)
     post[j,i] = rbeta(1, a, b)
}
colnames(post) = as.character(kobe$Season[1:20])
library(tidyr)
library(tidyverse)
post.m = as.data.frame(post) %>% gather(key = "year")
qplot(data = post.m, x = value, col = year, geom = "density") + scale_color_discrete(h = c(98, 360) + 15, c = 100, l = 65, h.start = 0, direction = 1, na.value = "grey50") + coord_cartesian(xlim = c(.28,.6))

