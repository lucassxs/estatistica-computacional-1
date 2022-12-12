###Definir o diretorio de dados

setwd("C:/Users/User/Desktop/comp")


###Leitura de dados

### db = base de dado,     header = cabeçalho,     sep = separação
dboriginal <- read.csv("heart.csv", header = TRUE, sep =",")
db <- dboriginal

###Vizualização dos dados
head(db)
####Verificar a dimensão dos dados
dim(db)
###Estrutura dos dados
str(db)


###restruturação do banco de dados{modificar os dados com 0,1, por sim ou não}
####ifelse( variavel, + condição de teste; se positivo, se negativo)

####Se a variavel evento for == 1 , acontece...
####Quando usar ifelse, executar no maximo uma vez, caso necessario todar o db mais uma vez
####Usar anetação{para facilitar leitura}

db$Event    <- ifelse(db$Event == 1, "Não-Censurado", "Censurado")
db$Gender   <- ifelse(db$Gender == 1, "Masculino", "Feminino")
db$Smoking  <- ifelse(db$Smoking == 1, "Sim", "Não")
db$Diabetes <- ifelse(db$Diabetes == 1, "Sim", "Não")
db$BP       <- ifelse(db$BP == 1, "Sim", "Não")
db$Anaemia  <- ifelse(db$Anaemia == 1, "Sim", "Não")



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



####Tabela de frequencia:Laço de repetição


tabs <- list()

for(i in 2:7)
{
  #####Selecionar elementos na lista [[]]
  tabs[[i-1]] <- freq(db[,i])
}

print(tabs)


#####tabela de frequencia para quantitativas


#### dois pontos significa de tal : até tal
for( i in c(1,8:13))
{
  tabs.quanti[[i]] <-table.freq(graph.freq(db[,i], plot = FALSE))
}





#####Aula 9/12/2022

####Graficos


#para criar um grágico de barras usa-se
####Grafico de varras variaveis qualitativas e quantitativas discretas


dbl <-db[1:15,] ####Amostra de 15 pacientes 
x <- table(db$Event)


####Definir um valor máximo e um mínimo para a variavel
max(dbl$Pletelets)
min(dbl$Pletelets)

####Criar uma margem
par(mar = c(4,4,4,1)) ####Padrão com titulo
###Remover os eixos axes = False
barplot(dbl$Pletelets, 
        axes = FALSE,
        names.arg = 1:15,  ###nomes dos arumentos
        xlab = "ID do paciente",   ####
        main = "Grafico de barras referente ao número de plaquetas \n dos pacientes com insuficiência",
        ylim = c(0,350000),    ####Definir os limites
        ylab= "Número de plaquetas (x 10³)",  ####Definir escrita no eixo Y
        cex.lab = 1.2  ####Aumentar tamanho da string no eixo
        )

#####axis(define-se o eixo, nomes dos eixos, de quanto em quanto 
#####las = 1 "Coloque todos os nomes na horizontal"

axis(side = 2, at = seq(0,350000,50000),labels = seq(0,350,50),las = 1) 



box()   ####Criar contorno gráfico



####Histograma

hist(db$Sodium,
     ylim = c(0,0.2),
     ylab = "Frequência Absoluta",
     xlab = "Níveis de Sódio",
     main = "Histograma relativo aos níveis de sódio dos pacientes \n com insuficiência cardiaca",
     freq = FALSE)


######BoxPlot

####definir um grupo usa-se o ~

boxplot(db$Sodium~db$BP,
        pch = 19, ####Definir as bolinhas como pretas
        ylab = "Níveis de sódio",
        xlab = "Pressão alta",
        main ="BoxPlot referente aos níveis de sódio dos pacientes \n com insuficiência cardiaca"
        )

head(dados)

grafbox <- list()
for (i in 9:13){
  grafbox[[i]] <- boxplot(dados [,i])~Smoking,
  pch=19)
}

























