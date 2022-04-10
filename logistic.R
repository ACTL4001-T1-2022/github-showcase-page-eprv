library('dplyr')
library('VIM')
library('ISLR')
library('MASS')
library('glmnet')
library('pROC')
library('pls') 
library('class')
library('caret')
library('gbm')
library('unbalanced')
library('stringr')
library('rpart')
library('readxl')

########################## passing

x <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/passing.xlsx",sheet="Rfinal")

# y <- rep(1,24)
# 
# x <- cbind(x,y) 

x <- x  %>% 
  dplyr::select(-1)

# response <- x %>% 
#   dplyr::select(6)
# 
# independent <- x %>% 
#   dplyr::select(-6)
# 
# train.na.cols <- apply(x, 2, function (col) sum(is.na(col)) / length(col))
# train.na.cols <- attributes(train.na.cols[which(train.na.cols != 0)])$names
# 
# 
# #Run kNN imputation to impute NA entries
# knn <- kNN(x, variable = train.na.cols, impNA = TRUE, imp_var = FALSE)

#Find number of NAs after imputation (Should be 0)
# sum(is.na(x))

model <- glm(formula = probability ~ ., data = x, family = "binomial")


model$coefficients
model$weights
model$residuals
model$deviance

y <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/passing.xlsx",sheet="Rfinalteam")
z <- y %>% 
  dplyr::select(-1,-2)

logistic.fit <- predict(model,
                        newdata = z,
                        type = "response")

# glm.fit(z,y[,2],family=binomial(link = "logit"))

p <- exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T))/(1+exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T)))

library(betareg)

beta <- betareg(formula = probability ~ ., data = x)

beta.fit <- predict(beta,
                        newdata = z,
                        type = "response")

prob10p <- 1 - (1-beta.fit)^10

averages <- matrix(nrow = ncol(x), ncol = 1)
averages[1,1] <- 1
averages[2,1] <- mean(x$Age)
averages[3,1] <- mean(x$`90s`)
averages[4,1] <- mean(x$`Short Att`)
averages[5,1] <- mean(x$`Short Cmp%`)
averages[6,1] <- mean(x$`Medium Att`)
averages[7,1] <- mean(x$`Medium Cmp%`)
averages[8,1] <- mean(x$`Long Att`)
averages[9,1] <- mean(x$`Long Cmp%`)
averages[10,1] <- mean(x$`A-xA`)
averages[11,1] <- mean(x$KP)
averages[12,1] <- mean(x$`1/3`)
averages[13,1] <- mean(x$PPA)
averages[14,1] <- mean(x$CrsPA)
averages[15,1] <- mean(x$Prog)

betamean <-abs( sum(beta$coefficients$mean * averages))

betavar <- betamean * (1 - betamean) / (1 + beta$coefficients$precision)

beta.fit - 0.95 * sqrt(betavar) / sqrt(nrow(x))

beta.fit + 0.95 * sqrt(betavar) / sqrt(nrow(x))


prob5p <- 1 - (1-beta.fit)^5



########################## passing 5 year!!!

x <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/passingfive.xlsx",sheet="Rfinal")

# y <- rep(1,24)
# 
# x <- cbind(x,y) 

x <- x  %>% 
  dplyr::select(-1)

# response <- x %>% 
#   dplyr::select(6)
# 
# independent <- x %>% 
#   dplyr::select(-6)
# 
# train.na.cols <- apply(x, 2, function (col) sum(is.na(col)) / length(col))
# train.na.cols <- attributes(train.na.cols[which(train.na.cols != 0)])$names
# 
# 
# #Run kNN imputation to impute NA entries
# knn <- kNN(x, variable = train.na.cols, impNA = TRUE, imp_var = FALSE)

#Find number of NAs after imputation (Should be 0)
# sum(is.na(x))

model <- glm(formula = probability ~ ., data = x, family = "binomial")


model$coefficients
model$weights
model$residuals
model$deviance

y <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/passingfive.xlsx",sheet="Rfinalteam")
z <- y %>% 
  dplyr::select(-1,-2)

logistic.fit <- predict(model,
                        newdata = z,
                        type = "response")

# glm.fit(z,y[,2],family=binomial(link = "logit"))

p <- exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T))/(1+exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T)))

library(betareg)

beta <- betareg(formula = probability ~ ., data = x)

beta.fit <- predict(beta,
                    newdata = z,
                    type = "response")

prob5p <- 1 - (1-beta.fit)^5

averages <- matrix(nrow = ncol(x), ncol = 1)
averages[1,1] <- 1
averages[2,1] <- mean(x$Age)
averages[3,1] <- mean(x$`90s`)
averages[4,1] <- mean(x$`Short Att`)
averages[5,1] <- mean(x$`Short Cmp%`)
averages[6,1] <- mean(x$`Medium Att`)
averages[7,1] <- mean(x$`Medium Cmp%`)
averages[8,1] <- mean(x$`Long Att`)
averages[9,1] <- mean(x$`Long Cmp%`)
averages[10,1] <- mean(x$`A-xA`)
averages[11,1] <- mean(x$KP)
averages[12,1] <- mean(x$`1/3`)
averages[13,1] <- mean(x$PPA)
averages[14,1] <- mean(x$CrsPA)
averages[15,1] <- mean(x$Prog)

betamean <-abs( sum(beta$coefficients$mean * averages))

betavar <- betamean * (1 - betamean) / (1 + beta$coefficients$precision)

beta.fit - 0.95 * sqrt(betavar) / sqrt(nrow(x))

beta.fit + 0.95 * sqrt(betavar) / sqrt(nrow(x))



################################################ defense

x <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/defense.xlsx",sheet="Rfinal")

x <- x  %>% 
  dplyr::select(-1)


model <- glm(formula = probability ~ ., data = x, family = "binomial")

y <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/defense.xlsx",sheet="Rfinalteam")
z <- y %>% 
  dplyr::select(-1,-2)

logistic.fit <- predict(model,
                        newdata = z,
                        type = "response")


p <- exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T))/(1+exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T)))

beta <- betareg(formula = probability ~ ., data = x)

beta.fit <- predict(beta,
                    newdata = z,
                    type = "response")


prob10d <- 1 - (1-beta.fit)^10

################################################ shooting

x <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/shooting.xlsx",sheet="Rfinal")

x <- x  %>% 
  dplyr::select(-1)


model <- glm(formula = probability ~ ., data = x, family = "binomial")

y <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/shooting.xlsx",sheet="Rfinalteam")
z <- y %>% 
  dplyr::select(-1,-2)

logistic.fit <- predict(model,
                        newdata = z,
                        type = "response")


p <- exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T))/(1+exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T)))

beta <- betareg(formula = probability ~ ., data = x)

beta.fit <- predict(beta,
                    newdata = z,
                    type = "response")


prob10s <- 1 - (1-beta.fit)^10

# probability of winning in 10 yrs = 1- probability of not winning at all in 10 yrs


################################################ goalkeeping

x <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/goalkeeping.xlsx",sheet="Rfinal")

x <- x  %>% 
  dplyr::select(-1)


model <- glm(formula = probability ~ ., data = x, family = "binomial")

y <- read_excel("C:/Users/Edward/OneDrive/2022 T1/ACTL4001/Data/goalkeeping.xlsx",sheet="Rfinalteam")
z <- y %>% 
  dplyr::select(-1,-2)

logistic.fit <- predict(model,
                        newdata = z,
                        type = "response")


p <- exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T))/(1+exp(model$coefficients[1]+sum(model$coefficients[-1]*z,na.rm=T)))

beta <- betareg(formula = probability ~ ., data = x)

beta.fit <- predict(beta,
                    newdata = z,
                    type = "response")


prob10g <- 1 - (1-beta.fit)^10
