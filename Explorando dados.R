#LIMPAR MEMORIA
rm(list=ls(all=TRUE))

# PACOTES
library(readxl)
library(ggplot2)
library(ggpubr)
library(car)
library(fBasics)
library(openxlsx)


#CARREGANDO DADOS CARGA DE MATERIAL COMBUSTIVEL X ALTURA DIGITAL

CARGA <- read_excel("dados_1_cmt.xlsx")

# AVALIANDO DISTRIBUIÇÃO GRAFICAMENTE #

# 1º OPÇÃO
hist(CARGA$CMT,
     col = "#FF8C00",
     freq = F,
     main = "Histograma de Frequência de Carga de Material Combustível",
     xlab= "Carga de Material Combustível (T/ha)"
     )
curve(dnorm(x, mean = mean(CARGA$CMT), sd = sd(CARGA$CMT)), add = T)

#2º OPÇÃO GGPLOT

ggplot(CARGA)+
  aes(x = CMT)+
  geom_histogram(fill= "#FF8C00",
                 col= "#4F4F4F",
                 bins = 10,
                 aes(y =..density..))+
  theme_minimal()+
  stat_function(fun = dnorm, args = list(mean = mean(CARGA$CMT), sd=sd(CARGA$CMT)))

## BOXPLOT

boxplot(CARGA$CMT,
        ylab = "Carga de Material Combustível (T/ha)",
        col = "#FF8C00",
        border = "#4F4F4F",
        horizontal = F,
        notch = F
)

basicStats(CARGA$CMT) # RESUMO ESTATISTICO BASICO


## VALIANDO NORMALIDADE ##
summary(CARGA$CMT)
shapiro.test(CARGA$CMT)
qqnorm(CARGA$CMT)
qqline(CARGA$CMT)
qqPlot(CARGA$CMT, dist='norm',envelope=.95)

## DADOS NAO APRESENTAM NORMALIDADE##

####################################################

## CORRIGINDO ANORMALIDADE ##

## POR TRANSFORMACAO ##

CMTRAIZ <- sqrt(CARGA$CMT)
HCRAIZ<-sqrt(CARGA$HC) ## PARA AS ANALISES FUTURAS, A ALTURA (HC) DEVE ESTA TRANSFORMADAS

##AVALIANDO NOVAMENTE NORMALIDADE

summary(CMTRAIZ)
shapiro.test(CMTRAIZ)
qqnorm(CMTRAIZ)
qqline(CMTRAIZ)
qqPlot(CMTRAIZ, dist='norm',envelope=.95)

##DADOS NORMALIZADO##

####################################################

## CRIAR UM NOVO DATA FRAME PARA OS DADOS TRANSFORMADOS

CARGA_NORMALIZADA<-data.frame(CMTRAIZ,HCRAIZ )

##AVALIAR GRAFICAMENTE A DISTRIBUICAO POS TRANSFORMACAO ##

boxplot(CARGA_NORMALIZADA$CMTRAIZ,
        ylab = "Carga de Material Combustível (T/ha)",
        col = "#FF8C00",
        border = "#4F4F4F",
        horizontal = F,
        notch = F
)

ggplot(CARGA_NORMALIZADA)+
  aes(x = CMTRAIZ)+
  geom_histogram(fill= "#FF8C00",
                 col= "#4F4F4F",
                 bins = 10,
                 aes(y =..density..))+
  theme_minimal()+
  stat_function(fun = dnorm, args = list(mean = mean(CARGA_NORMALIZADA$CMTRAIZ), sd=sd(CARGA_NORMALIZADA$CMTRAIZ)))


##EXPORTAR DATAFRAME
write.xlsx(CARGA_NORMALIZADA, "CARGA_NORMALIZADA.xlsx", overwrite = TRUE)








