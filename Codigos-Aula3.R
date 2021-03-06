# Aula 3 - Análises Exploratórias e Gráficos
rm(list=ls())
dev.off()
algas = read.csv("metais_algas.csv", sep = ";", dec = ",")
head(algas)
length(algas$As)

algas$N = rnorm(82,12,3)

# Análise exploratória. 
# DISTRIBUICAO
  # MEDIA; MEDIANA; DESVIO PADRAO; MAX; MINIMO; 
  # Gráficos - Histograma, BoxPlot, DIspersao.

# PARA Essas ANálises vamos fazer um subset com os dados de metais, sal, temp, Especies, Grupos, Locais, Face e Estaçao do Ano

algas_exp = subset(algas,select = c("Especie.e.Genero","Grupo","NS","Estacao","T.C","Salinidade","Cd","Pb","Zn","Cu","Hg","As","N"))
head(algas_exp)


algas_num = algas_exp[,-c(1:4)]
media = apply(algas_num,2,mean)
desvPad = apply(algas_num,2,sd)
mediana= apply(algas_num,2,median)
max = apply(algas_num,2,max)
min = apply(algas_num,2,min)
data.frame(media,desvPad,mediana,max,min)
dados = t(data.frame(media,desvPad,mediana,max,min))
round(dados,2)



hist(algas_exp$N)
boxplot(algas_exp$N)

qqnorm(algas_exp$N)
qqline(algas_exp$N)

#Separado
aggregate(algas_N$N~algas_N$Estacao+algas$Grupo, FUN = mean)

boxplot(algas_exp$N~algas_exp$Estacao+algas_exp$Grupo)
qqnorm(algas_exp$N[algas_exp$Grupo == 'Phaeophyceae'])
qqline(algas_exp$N[algas_exp$Grupo == 'Phaeophyceae'])


# Gráficos
boxplot(algas_exp$N~algas_exp$Estacao+algas_exp$Grupo)

library(sciplot)
bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo)

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20))

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao")

bargraph.CI(algas_exp$Estacao, algas_exp$N, algas_exp$Grupo, ylim = c(0,20), ylab = "Concentracao", xlab = "Estacao")



Grupo = table(algas_exp$Grupo)
SP = table(algas_exp$Especie.e.Genero)
NS = table(algas_exp$NS)
Estacao= table(algas_exp$Estacao)

barplot(Grupo)


# Utilizando a planilha Iris. 

#COnsiga os principais parametros de comprimento de pétala.
## Média, Mediana, DesvPad, Maximo e Minimo.
#Há alguma outra medida que podemos extrair dos dados?

## Faça um Boxplot para comprimento da sépala e outro para comprimento da pétala. 

## Faça um Histograma com os dados de largura de sépala. 

# Construa um gráfico com margens = 3, aumento dos eixos e um título. 
#Use as cores, azul, verde e vermelho. Os dados São so do Data.Frame abaixo
A = runif(30,10,20)
B = runif(30,20,30)
C = runif(30,30,40)
(para_grafico = c(A,B,C))

cores=rep(c("green","blue","red"), each = 30)

plot(para_grafico, col = cores, pch = rep(c(17,15,16),each = 30))

     