"
Seth Temple
Honors Thesis
Speed tests for rtweedie function
"

"
The upshot.
rtweedie runs fast for 1 <= p <= 2.
Use rnorm and rinvgauss to generate normals and inverse-Gaussians.
rtweedie performs poorly at generating `stable` Tweedie r.v.s.
Poisson-gamma r.v.s look like insurance claims with large phi and large mu.
"

# import the required packages
library(tweedie)
library(statmod)

# Generate Tweedie random variables with rtweedie function
{
  start <- Sys.time()
  y <- rtweedie(100, power=2.5, phi=1.5, mu=6)
  end <- Sys.time()
  print(end-start) # It takes about 8-9 seconds to simulate 100 of these r.v.s
  print(y[1:7])
}

{
  start <- Sys.time()
  y <- rtweedie(1000, power=2.5, phi=1.5, mu=6)
  end <- Sys.time()
  print(end-start) # We don't want to generate too many of these Tweedie r.v.s
  print(y[1:7])
}

# We generate Poisson-gammas much quicker
# We need large dispersion parameter to get data that looks like insurance claims data
{
  start <- Sys.time()
  y <- rtweedie(100, power=1.5, phi=300, mu=150)
  end <- Sys.time()
  print(end-start)
  print(y[1:30])
}

{
  start <- Sys.time()
  y <- rtweedie(100000, power=1.5, phi=300, mu=150)
  end <- Sys.time()
  print(end-start) # We could generate millions of Poisson-gammas
  print(y[1:30])
}


# Code defaults to rpoisson
# rpoisson is a very fast function
{
  start <- Sys.time()
  y <- rtweedie(1000000, power=1, phi=1, mu=1)
  end <- Sys.time()
  print(end-start)
  print(y[1:30])
}

# Code defaults to rgamma
# rgamma is a very fast function
{
  start <- Sys.time()
  y <- rtweedie(1000000, power=2, phi=2, mu=2)
  end <- Sys.time()
  print(end-start)
  print(y[1:30])
}

# rtweedie generates inverse-Gaussian random variables very slowly
# Use rinvgauss from statmod package
{
  start <- Sys.time()
  y <- rtweedie(1000, power=3, phi=1, mu=1)
  end <- Sys.time()
  print(end-start)
  print(y[1:30])
}
{
  start <- Sys.time()
  y <- rinvgauss(1000, 1)
  end <- Sys.time()
  print(end-start) # rinvgauss executes much faster
  print(y[1:30])
}

# Error says rtweedie expects power greater than 1
# Use rnorm to generate Tweedie r.v.s with power 0
"
{
  start <- Sys.time()
  y <- rtweedie(1000000, power=0, phi=1, mu=5)
  end <- Sys.time()
  print(end-start)
  print(y[1:30])
}
"
# Error suggests we can't generate Tweedie r.v.s with power less than 0
# Though Jorgensen's book The Theory of Dispersion Models says such r.v.s do exist


# Generate Tweedie r.v.s for p > 3
{
  start <- Sys.time()
  y <- rtweedie(100, power=4, mu=2, phi=2)
  end <- Sys.time()
  print(end-start)
  print(y[1:7])
}
"
{
  start <- Sys.time()
  y <- rtweedie(10, power=6, mu=2, phi=2)
  end <- Sys.time()
  print(end-start)
  print(y[1:7])
}
"
# Execution time is slow
# Do not uncomment and run the last snip of code
# rtweedie fails/takes a lot of time to generate such Tweedie r.v.s
# Moreover, we don't really know what data such r.v.s would describe
