"
Seth Temple
Honors Thesis
Explore variables in Liberty Mutual Home Fire Dataset (Loss Cost Modeling)
"

library(statmod)
library(tweedie)

lmgHomeFire.LossCost <- read.csv("~/TweedieThesis/lmFirePerilTrain/train.csv",
                                 header=TRUE, sep=",")

PropertyFire <- subset(lmgHomeFire.LossCost,
                   !(is.na(lmgHomeFire.LossCost$geodemVar5)))

PropertyFire$var1 <- NULL
PropertyFire$var2 <- NULL
PropertyFire$var3 <- NULL
PropertyFire$var5 <- NULL
PropertyFire$var6 <- NULL

rm(lmgHomeFire.LossCost)

#weatherVar29
#weatherVar151
#var4 glm.fit didn't converge
{
model <- glm(target~var10+var13+geodemVar24+geodemVar37+weatherVar10+weatherVar7
             +weatherVar72+weatherVar102+weatherVar104-1+weatherVar118
             +weatherVar173+var8, 
             data=PropertyFire,
             family=tweedie(var.power=1.5,link.power=0))
print(summary(model))
AICtweedie(model, k=2, 73) # 73 from previous efforts. Just trying to get more features.
}


