#LIMPAR MEMORIA
rm(list=ls(all=TRUE))

if(!require(dplyr)){install.packages("dplyr")}
if(!require(tidyr)){install.packages("tidyr")}
if(!require(ggplot2)){install.packages("ggplot2")}
if(!require(broom)){install.packages("broom")}
#-------------------------------------------------------------------------------

# PARA A ANÁLISE SERÁ UTILIZADA DADOS DISPONIBILIZADO NO REPOSITORIO MTCAR

data(mtcars)
#------------------------------------------------------------------------------

mod <- glm(am~mpg,mtcars,family = binomial)
summary(mod)


ajuste <- mod %>%
  augment(type.predict = "response") %>%
  mutate(y_hat = .fitted) %>%  # Valores de probabilidade para cada observacao
  mutate(odds = y_hat/(1-y_hat)) %>% # Valores de chance para cada observacao (PROBIT)
  mutate(log_odds =log(odds)) %>%  # Valores de log(chance) para cada observacao (LOGIT)
  select(am,mpg,y_hat,odds,log_odds)

print(ajuste)

ggplot(ajuste, aes(x = mpg, y = y_hat)) +
  geom_point() + geom_line() +
  scale_y_continuous("Probabilidade de ser automático")

ggplot(ajuste, aes(x = mpg, y = odds)) +
  geom_point() + geom_line() +
  scale_y_continuous("Chance (PROBIT) de ser automático")


prever = predict(mod, newdata = mtcars, type = 'response')
prever <- prever >= 0.5
prever

confusao <- table(prever, mtcars$am)
confusao
taxaacerto <- (confusao[1] + confusao[4]) / sum(confusao)
taxaacerto
