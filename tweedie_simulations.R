"
Seth Temple
Honors Thesis
Evaluating tweedie R package on simulations
"

# import required packages
library(tweedie)
library(statmod)

"
I use interpolation as the method in tweedie.profile. This choice lets the function decide
whether to use series evaluation or Fourier transform to find the density.
Use link.power=1 to get the identity link.
Set verbose=2 to get feedback.
Set do.plot=TRUE to see a graph of the likelihoods given p.
do.smooth=FALSE allows code to run faster. However, there is no smoothing done for the
likelihood graph. Output p.max and phi.max correspond to the best p in p.vec.
"

{
  a <- rtweedie(10000, power=1.33, mu=100, phi=200)
  print(a[1:9])
}
{
  out <- tweedie.profile(a~1, p.vec=seq(1.1,1.9,.05),
                       method="interpolation", link.power=1)
            # issues could arise for p close to 1 or p close to 2
  print(out$p.max)
  print(out$phi.max)
}
{
  out <- tweedie.profile(a~1, p.vec=seq(1.1,1.9,.01),
                         method="interpolation", link.power=1)
  print(out$p.max)
  print(out$phi.max)
}

{
  b <- rtweedie(10000, power=1.5, mu=100, phi=200)
  print(b[1:20])
}
{
  out <- tweedie.profile(b~1, p.vec=seq(1.1,1.9,.05),
                         method="interpolation", link.power=1)
  print(out$p.max)
  print(out$phi.max)
}

{
  c <- rtweedie(10000, power=1.75, mu=100, phi=200)
  print(c[1:20])
}
{
  out <- tweedie.profile(c~1, p.vec=seq(1.1,1.9,.05),
                         method="interpolation", link.power=1)
  print(out$p.max)
  print(out$phi.max)
}
# tweedie.profile performs well for estimating Poisson-gammas

{
  d <- rtweedie(100, power=2, mu=10, phi=5)
  print(d[1:20])
}
{
  out <- tweedie.profile(d~1, p.vec=seq(1.1,3.0,.1),
                         method="interpolation", link.power=1)
  print(out$p.max)
  print(out$phi.max)
}
# tweedie.profile performs well for estimating gammas

{
  e <- rinvgauss(1000, 2, 2)
  print(e[1:20])
}
{
  out <- tweedie.profile(e~1, p.vec=seq(2.5,3.5,.1),
                         method="interpolation", link.power=1)
  print(out$p.max)
  print(out$phi.max)
}
# tweedie.profile performs okay for estimating inverse-Gaussians
# Use rinvgauss, not rtweedie

"
I received many errors when I tried to do tweedie.profile on rtweedie objects with
p not corresponding to Poisson gammas, gammas, or inverse-Gaussians. On the other hand,
tweedie.profile works fine for modeling AutoBi and AutoClaims in the insuranceData package.
In my studies, p is close to 2.5 for AutoBi$LOSS and AutoClaims$PAID. Dunn and Smyth only
share case studies of their algorithms for p=1.5 and p=3 in their papers. (p=1.5 corresponds
to a non-centralchi-squared distribution?)

We won't worry too much about these errors in the simulations. In practice, we want
tweedie.profile to work for real-life datasets. I suspect there are some issues
with the rtweedie function.

Writing this .R file inspired me to define a testing function. See tweedie_modeling_functions.R.
"
