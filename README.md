# tweedie_power_parameter_thesis
This repository stores code Seth Temple used in writing his undergraduate honors thesis. The thesis' title is "The Tweedie Index Parameter and Its Estimator: An Introduction with Applications to Actuarial Ratemaking". He uses R and the tweedie package to analyze insurance claims data.

# Abstract
This is a rough draft of my abstract. I suspect some wording may change.

Tweedie models are exponential dispersion models that have power unit variance functions, are infinitely divisible, and are closed under translations and scale transformations. The theory of these probability distributions is presented in a way that is accessible to students and professionals in STEM. Most Tweedie models have no closed form density function, so statistical software relies on numerical approximation methods. Peter Dunn and Gordon Smyth propose three techniques to approximate these densities in the R tweedie package. We discuss the theory and application of these techniques.

Actuaries use Tweedie models to predict loss costs, claim frequency, and claim severity in the insurance industry. Although the Tweedie power parameter can take on infinitely many values, most insurance models assume a parameter value that corresponds to a Poisson, gamma, or inverse-Gaussian random variable. An algorithm is developed in R to estimate the power parameter. This algorithm is tested on simulations and applied to a large property insurance dataset. Preliminary results suggest that estimating the power parameter provides marginal improvement in predicting the loss costs for household fire perils.

# Most interesting files
model_autobi.Rmd
model_lmig_home_fire.Rmd
rtweedie_speed_test.R
tweedie_simulations.R

# Where to find this research

Seth's paper is available on UO's Scholars Bank (https://scholarsbank.uoregon.edu/xmlui/). Seth defended his thesis on May 14, 2018. He presented his work at the UO Undergraduate Research Symposium on May 17, 2018.

# Imports

Use RStudio as an integrated development environment. You must install statmod, tweedie, insuranceData, and ggplot2 packages to run all the code. To access the LMIG Home Fire Perils data, visit https://www.kaggle.com/c/liberty-mutual-fire-peril.

# Acknowledgments

UO Professor Chris Sinclair served as my primary thesis advisor and was a wonderful academic resource. Peter Ralph and Samantha Hopkins also sat on the thesis defense committee. Lastly, I would be remiss to not mention Peter Dunn, Gordon Smyth, Bent Jorgensen, and Maurice Tweedie. These four, and many other mathematicians, built up what we know about the Tweedie family.
