"
Seth Temple
Honors Thesis
Explore variables in Liberty Mutual Home Fire Dataset (Loss Cost Modeling)
"

"
This R script I used to explore the 300+ variables for a pure premium model. We don't try to 
build a perfect model. We just want a model that suffices for analyzing different
Tweedie powers. Essentially, we want to find some features that could be predictive.

We arbitrate based on information about AIC, Deviance, and significance of the variable.
We want a model that has 10+ features. We don't worry too much about wrangling. In general,
we don't use columns that have empties.
"

" Variables I'll use
var10       var13         geodemVar24   geodemVar37   weatherVar10
 weatherVar35  weatherVar72  weatherVar102 weatherVar104
"

library(statmod)
library(tweedie)

# set the working directory with scroll down bar from Session
lmgHomeFire.LossCost <- read.csv("train.csv",
                                 header=TRUE, sep=",")
lmgHomeFire.LossCost <- subset(lmgHomeFire.LossCost,
                                  !(is.na(lmgHomeFire.LossCost$geodemVar5)))
lmgHomeFire.LossCost <- subset(lmgHomeFire.LossCost, id != 370705)
  # apparently this one observation kept messing up AICtweedie

good_features <- c()
okay_features <- c()

"
Note. I don't advise what I do next. I manually check AIC for different variables.
Apparently MASS package has a function stepAIC to do this. Though it doesn't
work with AICtweedie at this time. Perhaps some future research could look into
making stepAIC compatible with AICtweedie.
"

m0 <- glm(target~1, 
          data=lmgHomeFire.LossCost,
          family=tweedie(var.power=1.5, link.power=0))
summary(m0)
AICtweedie(m0)

{
  m1 <- glm(target~1+var10,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
  print(AICtweedie(m1) - AICtweedie(m0))
}
good_features <- append(good_features, 'var10')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
  print(AICtweedie(m1) - AICtweedie(m0))
}
good_features <- append(good_features, 'var13')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
  print(AICtweedie(m1) - AICtweedie(m0))
}
good_features <- append(good_features, 'geodemVar24')
m0 <- m1

"
{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar30,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
  print(AICtweedie(m1) - AICtweedie(m0))
}
good_features <- append(good_features, 'geodemVar30')
m0 <- m1
"

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
  print(AICtweedie(m1) - AICtweedie(m0))
}
good_features <- append(good_features, 'geodemVar37')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar10')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar18')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18+weatherVar35,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar35')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18+weatherVar35+weatherVar72,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar72')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18+weatherVar72+weatherVar85,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar85')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18+weatherVar72+weatherVar85+weatherVar102,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar102')
m0 <- m1

{
  m1 <- glm(target~1+var10+var13
            +geodemVar24+geodemVar37
            +weatherVar10+weatherVar18+weatherVar72+weatherVar85+weatherVar102
            +weatherVar104,
            data=lmgHomeFire.LossCost,
            family=tweedie(var.power=1.5, link.power=0))
  print(summary(m1))
  print(anova(m1,m0))
}
good_features <- append(good_features, 'weatherVar104')
m0 <- m1