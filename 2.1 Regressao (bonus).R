#LIMPANDO MEMORIA
rm(list = ls())

#PACOTES
library(ggplot2)
library(hexbin)
library(ggpubr)
library(RColorBrewer)
library(readxl)

##                       CARREGANDO DADOS

DADOS_R <- read_excel("2.1 Regressao bonus.csv")


library(ggplot2) # Para plotar os dados
library(hexbin)  # Para plotar a frequência
library(ggpubr)  # Fornece ferrramentas para os gráficos
library(RColorBrewer) # Fornece paleta de cores


# lendo os dados
dados <- read.csv('dados/peso_altura.csv')

#Convertendo para metros e kg
dados$altura <- dados$Height*0.0254
dados$peso <- dados$Weight*0.453597

# Definindo a opacidade das bordas
bordas <- adjustcolor( "gray40", alpha.f = 0.2)

# Definindo a fórmula para regressão linear
minha.formula <- altura~peso

#######################################
## Plotando os dados            #######
#######################################

meu.plot <- ggplot(dados, aes(x=altura,y=peso)) + # Especificando os dados e os eixos
  geom_hex(bins=60,col=bordas)+         # Adicionando a frequência dos dados como hex bins (caixas hexagonais)
  geom_smooth(formula ='y ~ x' ,method = lm,
              se = FALSE,col="gray30")+ #adiciona a reta de regressão
  scale_fill_gradientn(colours = rev(brewer.pal(5, "Spectral")))+ # Definindo a paleta de cores
  stat_regline_equation(aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")))+#adicionando a equação e o R² ao gráfico
  labs(x='Altura [m]',
       y='Peso [Kg]',
       fill="Frequência\nAbsoluta")+
  theme_bw()

meu.plot

#######################################
## Salvando o gráfico                ##
#######################################

ggsave(filename = "figs/regressao.png",
       height = 5.77,
       width = 8.31,
       scale =.8)
