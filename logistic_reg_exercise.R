## Exercise: logistic regression
## ───────────────────────────────────

##   Use the NH11 data set that we loaded earlier.

##   1. Use glm to conduct a logistic regression to predict ever worked
##      (everwrk) using age (age_p) and marital status (r_maritl).
##   2. Predict the probability of working for each level of marital
##      status.

##   Note that the data is not perfectly clean and ready to be modeled. You
##   will need to clean up at least some of the variables before fitting
##   the model.

## __________________________________________________
## My Answer: 

  # load data
NH11 <- readRDS("dataSets/NatHealth2011.rds")
labs <- attributes(NH11)$labels


  # check data and clean data as needed
str(NH11$everwrk) 
summary(NH11$everwrk) 
NH11$everwrk <- factor(NH11$everwrk, levels=c("1 Yes", "2 No"))


str(NH11$age_p)
summary(NH11$age_p)

str(NH11$r_maritl) 
levels(NH11$r_maritl) 

  ## Question 1:
everwrk.mod <- glm(everwrk ~ age_p + r_maritl,
               data=NH11, family="binomial")
summary(everwrk.mod)


  ## Question 2: 

library(effects)
Effect("r_maritl", everwrk.mod2) 
