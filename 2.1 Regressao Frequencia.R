##################################################################
##  script para plotar uma regressao linear e a frequencia     ###
##  de dados usando os pacotes ggplot2, hexbin e ggpubr         ##
##                                                              ##
##                                                              ##
## desenvolvido por: Mercel Santos                             ###
## contato: contato@mercelsantos.com                           ###
## instagram: @mercelsantos                                    ###
##################################################################


rm(list = ls())  #Remove todos os objetos da mem?ria


####################################################
## Carregando os pacotes                         ###
##                                               ###
## certifique-se de que todos os pacotes         ###
## usados abaixo estao instalados                ###
####################################################

library(ggplot2) # Para plotar os dados
library(hexbin)  # Para plotar a frequencia
library(ggpubr)  # Fornece ferrramentas para os graficos
library(RColorBrewer) # Fornece paleta de cores
library(readr)
# lendo os dados
dados <- read_csv("peso_altura.csv")

#Convertendo para metros e kg
dados$altura <- dados$Height*0.0254
dados$peso <- dados$Weight*0.453597

# Definindo a opacidade das bordas
bordas <- adjustcolor( "gray40", alpha.f = 0.2)

# Definindo a f?rmula para regress?o linear
minha.formula <- altura~peso

#######################################
## Plotando os dados            #######
#######################################

meu.plot <- ggplot(dados, aes(x=altura,y=peso)) + # Especificando os dados e os eixos
  geom_hex(bins=60,col=bordas)+         # Adicionando a frequencia dos dados como hex bins (caixas hexagonais)
  geom_smooth(formula ='y ~ x' ,method = lm,
              se = FALSE,col="gray30")+ #adiciona a reta de regressao
  scale_fill_gradientn(colours = rev(brewer.pal(5, "Spectral")))+ # Definindo a paleta de cores
  stat_regline_equation(aes(label=paste(..eq.label.., ..rr.label.., sep = "~~~~")))+#adicionando a equacao e o R² ao grafico
  labs(x='Altura [m]',
       y='Peso [Kg]',
       fill="Frequencia\nAbsoluta")+
  theme_bw()

meu.plot
