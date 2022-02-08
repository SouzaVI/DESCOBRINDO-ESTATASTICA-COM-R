#LIMPAR MEMORIA
rm(list=ls(all=TRUE))

# PACOTES
library(readxl)
library(ggplot2)

#CARREGANDO DADOS CARGA DE MATERIAL COMBUSTÍVEL X ALTURA DIGITAL

CARGA <- read_excel("dados_1_cmt.xlsx")

# AVALIANDO DISTRIBUIÇÃO GRAFICAMENTE #

# 1º OPÇÃO
hist(CARGA$CMT,
     col = "lightblue",
     freq = F,
     main = "Histograma de Frequência de Carga de Material Combustível",
     xlab= "Carga de Material Combustível (T/ha)"
     )
curve(dnorm(x, mean = mean(CARGA$CMT), sd = sd(CARGA$CMT)), add = T)

#2º OPÇÃO GGPLOT

ggplot(CARGA)+
  aes(x = CMT)+
  geom_histogram(fill= "orange",
                 col= "black",
                 alpha = 0.5,
                 bins = 20,
                 aes(y =..density..))+
  stat_function(fun = dnorm, args = list(mean = mean(CARGA$CMT), sd=sd(CARGA$CMT)))

