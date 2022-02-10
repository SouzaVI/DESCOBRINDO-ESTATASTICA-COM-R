#LIMPAR MEMORIA
rm(list=ls(all=TRUE))

# PACOTES
library(readxl)
library(ggplot2)
library(ggpubr)
library(car)
library(fBasics)
library(openxlsx)

#-------------------------------------------------------------------------------
#                            CARREGANDO DADOS
#-------------------------------------------------------------------------------

DADOS <- read_excel("DADOS.xlsx")

#-------------------------------------------------------------------------------
#                 AVALIANDO DISTRIBUICAO GRAFICAMENTE
#-------------------------------------------------------------------------------
# 1º OPÇÃO

hist(DADOS$Y,
     col = "#FF8C00",
     freq = F,
     main = "Histograma de Frequência de Y",
     xlab= "Y"
     )
curve(dnorm(x, mean = mean(DADOS$Y), sd = sd(DADOS$Y)), add = T)

#2º OPÇÃO GGPLOT

ggplot(DADOS)+
  aes(x = Y)+
  geom_histogram(fill= "#FF8C00",
                 col= "#4F4F4F",
                 bins = 5,
                 aes(y =..density..))+
  theme_minimal()+
  stat_function(fun = dnorm, args = list(mean = mean(DADOS$Y), sd=sd(DADOS$Y)))

# BOXPLOT

boxplot(DADOS$Y,
        col = "#FF8C00",
        border = "#4F4F4F",
        horizontal = F,
        notch = F
)

basicStats(DADOS$Y) # RESUMO ESTATISTICO BASICO

#-------------------------------------------------------------------------------
#                      AVALIANDO NORMALIDADE
#-------------------------------------------------------------------------------
summary(DADOS$Y)
shapiro.test(DADOS$Y)
qqnorm(DADOS$Y)
qqline(DADOS$Y)
qqPlot(DADOS$Y, dist='norm',envelope=.95)


#                                NOTA
# DADOS APRESENTAM NORMALIDADE##
# CASO SEUS DADOS NAO APRESENTAM DISTRIBUICAO NORMAL, VOCE DEVERA NORMALIZAR,
# CASO AO CONTRARIO VERIFICAR O MOTIVO
# CASO SEUS DADOS TENHAM ESSA TENDENCIA DE ANORMALIDADE NA DISTRIBUICAO, UTILIZE
# METODOS NAO - PARAMETRICOS PARA SUAS ANALISES ESTATISTICAS
#-------------------------------------------------------------------------------

#                   AVALIANDO ERRO AMOSTRAL DO EXPERIMENTO

## VERIFICAR SE SEU NUMERO DE AMOSTRA E SUFICIENTE PARA ANALISES ESTATISTICA CONFIAVEL

t=2.20009 # VALOR T - GRAU DE LIBERDADE (12-1 = 11) E ALFA 5%
ERRO_PADRAO_DA_MEDIA = 2.34/sqrt(12) # (desvio padrao/raiz(nº de amostra)) # verificar informacao no resumo estatistico do basicStasts
media=mean(DADOS$Y)
ERRO_AMOSTRAL = (ERRO_PADRAO_DA_MEDIA*t/media)*100

ERRO_AMOSTRAL
#-------------------------------------------------------------------------------
#                                NOTA
## O NUMERO DE AMOSTRAS FORAM SUFICIENTES, A NIVEL DE 5% DE PROBILIDADE COM ERRO
# INFERIOR A 10%
#-------------------------------------------------------------------------------





