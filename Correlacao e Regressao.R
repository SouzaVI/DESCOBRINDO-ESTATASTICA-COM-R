#LIMPAR MEMORIA
rm(list=ls(all=TRUE))

#                          PACOTES
library(readxl)
library(ggplot2)
library(ggpubr)
library(car)
library(fBasics)
library(GGally)
library(dplyr)
library(mctest, REdaS)

#                        CARREGANDO DADOS

DADOS_R <- read_excel("DADOS.xlsx")

#                   CORRELACAO de PEARSON r²

ggpairs(DADOS_R, lower = list(continuous = "smooth")) #Gráfico
cor.test(DADOS_R$Y, DADOS_R$X )
#-------------------------------------------------------------------------------
#                                NOTA
#                     CORRELACAO SIGNIFICATIVA
#-------------------------------------------------------------------------------

#                         MODELO DE REGRESSAO

modelo1<-lm(DADOS_R$Y ~ DADOS_R$X ) # Y= B0+ B1*X
summary(modelo1)
anova(modelo1)
par(mfrow=c(2,2))
plot(modelo1) # Diagnóstico completo dos
coef(modelo1)      # Coeficientes do modelo (intercepto e beta)
predict(modelo1)   # Valores previstos pelo modelo
residuals(modelo1) # Resíduos do modelo

#-------------------------------------------------------------------------------
#                      TESTE DE MULTICOLINEARIDADE
#-------------------------------------------------------------------------------
#                                NOTA
#
# A multicolinearidade existe quando observamos uma forte correlacao entre dois
# ou mais previsores em um modelo de regressao. Para uma equação
# multicolinearidade é um problema! pois dificultada a avaliacao dos previsores
# individualmente Em nosso exemplo temos somente um previsor, portanto o teste,
# nao se aplica                        -
#-------------------------------------------------------------------------------

#mctest::imcdiag(modelo1, method = "VIF", vif = 1)

#-------------------------------------------------------------------------------
# PARA O ESTUDO O MODELO Y= B0+ B1*X , TEVE UM R²AJ = 0.979 E UM ERRO PADRAO
# RESIDUAL = 1.12
#------------------------------------------------------------------------------
# O NUMERO DE AMOSTRAS É SUFICIENTE PARA GENERALIZAR O MODELO?
#
# EXISTE UMA REGRRA BASTANTE DIFUNDIDA 10 AMOSTRAS POR PREVISOR, NESSE CASO TEMOS
# 1 PREVISOR 10*1 = 10 AMOSTRAS,  EXISTE EM LITERATURAS GREEN(1991), RECOMENDA
# 104 AMOSTRAS + O NUMERO DE PREVISORES.
# NAO EXISTE UMA RECEITA PARA ESSE CASO, DEPENDERA COMO OS SEUS PREVISORE PREVEEM
# A SAIDA
