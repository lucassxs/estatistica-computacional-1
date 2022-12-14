###Definir o diretorio de dados

setwd("C:/Users/User/Desktop/comp")


###Leitura de dados

### db = base de dado,     header = cabe?alho,     sep = separa??o
dboriginal <- read.csv("heart.csv", header = TRUE, sep =",")
db <- dboriginal

###Vizualiza??o dos dados
head(db)
####Verificar a dimens?o dos dados
dim(db)
###Estrutura dos dados
str(db)


###restrutura??o do banco de dados{modificar os dados com 0,1, por sim ou n?o}
####ifelse( variavel, + condi??o de teste; se positivo, se negativo)

####Se a variavel evento for == 1 , acontece...
####Quando usar ifelse, executar no maximo uma vez, caso necessario todar o db mais uma vez
####Usar aneta??o{para facilitar leitura}

db$Event    <- ifelse(db$Event == 1, "N?o-Censurado", "Censurado")
db$Gender   <- ifelse(db$Gender == 1, "Masculino", "Feminino")
db$Smoking  <- ifelse(db$Smoking == 1, "Sim", "N?o")
db$Diabetes <- ifelse(db$Diabetes == 1, "Sim", "N?o")
db$BP       <- ifelse(db$BP == 1, "Sim", "N?o")
db$Anaemia  <- ifelse(db$Anaemia == 1, "Sim", "N?o")



head(db,n=1)


####tabelas de frequencia
install.packages("summarytools")###Tabela de frequencia
install.packages("agricolae")

library(summarytools)
library(agricolae)

####Tabela de frequencias variavel: Event
freq(db$Event)
freq(db$Gender)
freq(db$Smoking)
freq(db$Diabetes)
freq(db$BP)
freq(db$Anaemia)


####Tabela de frequencia ara dados continuos
####Tabela de frequencias: Pletelets

tab         <- with(db, graph.freq(Pletelets, plot = FALSE))
print(table.freq(tab),row.names = FALSE)

tabCreatine <-with(db, graph.freq(Creatinine, plot = FALSE))
print(table.freq(tabCreatine),row.names = FALSE)

tabSodium   <- with(db, graph.freq(Sodium, plot = FALSE))
print(table.freq(tabSodium), row.names = FALSE)

tabCPK      <- with(db, graph.freq(CPK, plot = FALSE))
print(table.freq(tabCPK), row.names = FALSE)



####Tabela de frequencia:La?o de repeti??o


tabs <- list()

for(i in 2:7)
{
  #####Selecionar elementos na lista [[]]
  tabs[[i-1]] <- freq(db[,i])
}

print(tabs)


#####tabela de frequencia para quantitativas


#### dois pontos significa de tal : at? tal
for( i in c(1,8:13))
{
  tabs.quanti[[i]] <-table.freq(graph.freq(db[,i], plot = FALSE))
}





#####Aula 9/12/2022

####Graficos


#para criar um gr?gico de barras usa-se
####Grafico de varras variaveis qualitativas e quantitativas discretas


dbl <-db[1:15,] ####Amostra de 15 pacientes 
x <- table(db$Event)


####Definir um valor m?ximo e um m?nimo para a variavel
max(dbl$Pletelets)
min(dbl$Pletelets)

####Criar uma margem
par(mar = c(4,4,4,1)) ####Padr?o com titulo
###Remover os eixos axes = False
barplot(dbl$Pletelets, 
        axes = FALSE,
        names.arg = 1:15,  ###nomes dos arumentos
        xlab = "ID do paciente",   ####
        main = "Grafico de barras referente ao n?mero de plaquetas \n dos pacientes com insufici?ncia",
        ylim = c(0,350000),    ####Definir os limites
        ylab= "N?mero de plaquetas (x 10?)",  ####Definir escrita no eixo Y
        cex.lab = 1.2  ####Aumentar tamanho da string no eixo
        )

#####axis(define-se o eixo, nomes dos eixos, de quanto em quanto 
#####las = 1 "Coloque todos os nomes na horizontal"

axis(side = 2, at = seq(0,350000,50000),labels = seq(0,350,50),las = 1) 



box()   ####Criar contorno gr?fico



####Histograma

hist(db$Sodium,
     ylim = c(0,0.2),
     ylab = "Frequ?ncia Absoluta",
     xlab = "N?veis de S?dio",
     main = "Histograma relativo aos n?veis de s?dio dos pacientes \n com insufici?ncia cardiaca",
     freq = FALSE)


######BoxPlot

####definir um grupo usa-se o ~

boxplot(db$Sodium~db$BP,
        pch = 19, ####Definir as bolinhas como pretas
        ylab = "N?veis de s?dio",
        xlab = "Press?o alta",
        main ="BoxPlot referente aos n?veis de s?dio dos pacientes \n com insufici?ncia cardiaca"
        )

head(dados)

grafbox <- list()
for (i in 9:13){
  grafbox[[i]] <- boxplot(dados [,i])~Smoking,
  pch=19)
}

























