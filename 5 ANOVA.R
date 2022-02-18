# CREDITOS: Amanda Munari Guimarães
#-------------------------------------------------------------------------------
# LIMPAR MEMORIA

rm(list=ls(all=TRUE))
#-------------------------------------------------------------------------------



#                  Valores - Exemplo aleatório

Y <- c(rnorm(10,21,1),rnorm(10,17,2),rnorm(10,15,2)) # Variável resposta
X <- rep(c("T1","T2","T3"),each=10)  # Variável explicativa (categórica)

dados <- data.frame(Y,X)
dados

#-------------------------------------------------------------------------------
#                               TESTE ANOVA
#-------------------------------------------------------------------------------
modelo.anova <- lm(Y ~ X, data= dados)
summary(modelo.anova)

anova(modelo.anova)
modelo.anova2 <- aov(Y ~ X, data= dados)

# Calculando media e erro
medias <- with(dados,tapply(Y,X,mean))
erro <- with(dados,tapply(Y,X,function(x) sqrt(var(x)/length(x))))

x <- barplot(medias,beside=T,ylim=c(0,20),ylab="Y",xlab="X")
arrows(x0=x,y0=medias-erro,
       x1=x,y1=medias+erro,
       angle=90,length=0.14,code=3)

# teste Posthoc
TukeyHSD(modelo.anova2)

par(mfrow=c(2,2))
plot(modelo.anova)

