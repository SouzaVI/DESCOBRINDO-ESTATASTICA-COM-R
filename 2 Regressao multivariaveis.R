#LIMPAR MEMORIA
rm(list=ls(all=TRUE))
#-------------------------------------------------------------------------------
#                               PACOTES
#-------------------------------------------------------------------------------
library(ggplot2)
library(ggpubr)
library(car)
library(fBasics)
library(GGally)

#-------------------------------------------------------------------------------
#                        CARREGANDO DADOS
#-------------------------------------------------------------------------------

data("mtcars")

#-------------------------------------------------------------------------------
#                   CORRELACAO de PEARSON r²
#-------------------------------------------------------------------------------

ggpairs(mtcars, lower = list(continuous = "smooth"))

#-------------------------------------------------------------------------------
#                PRIMEIRA MODELO COM TODAS AS VARIAVEIS
#-------------------------------------------------------------------------------

modelo1<-lm(mpg ~ wt + cyl + disp + hp + drat + wt + qsec + vs + am + gear +
           carb, mtcars)
summary(modelo1)

#-------------------------------------------------------------------------------
#            APLICANDO METODO DE SELECAO DE VARIAVEIS STEPWISE
#-------------------------------------------------------------------------------

modelo2<-step(modelo1, direction = "both") # indica quais variaveis  podem
                                           # ser retiradas sem perde qualidade

summary(modelo2) # modelo final e equacao ajustada

#-------------------------------------------------------------------------------
#                    TESTE DE MULTICOLINEARIDADE
#-------------------------------------------------------------------------------

vif(modelo2) # Valores superiores a 5 indicam colinearidades, e devem ser
             # eliminadas
#-------------------------------------------------------------------------------
#           DETECCAO DE VALORES ATIPICOS E SIGNIFICATIVOS
#-------------------------------------------------------------------------------
par(mfrow=c(2,2))
plot(modelo2) # Diagnóstico completo dos
coef(modelo2)      # Coeficientes do modelo (intercepto e beta)
predict(modelo2)   # Valores previstos pelo modelo
residuals(modelo2) # Resíduos do modelo

