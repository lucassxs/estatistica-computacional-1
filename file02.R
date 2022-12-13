##### AULA 09/12/2022


### GRAFICOS

#grafico de barras (variaceis qualitativas e quantitativas discretas)

max(db1$Pletelets)
min(db1$Pletelets)

par(mar = c(4,4,4,1))
db1 <- db[1:15,]
barplot(db1$Pletelets, 
        axes = FALSE, 
        names.arg = 1:15,
        xlab = 'ID do Paciente',
        main = 'Gr?fico de barras referente ao n?mero de plaquetas \n dos pacientes com insufi?ncia cardi?ca',
        ylim = c(0,350000),
        ylab = 'N?mero de Plaquetas (x10?)',
        cex.lab = 1.2,
        col = c("red", "green", "yellow", "pink"))
axis(side = 2, at = seq(0,350000,50000),labels = seq(0,350,50),las = 1)


#### histograma

hist(db1$Sodium,
     ylim = c(0,0.2),
     ylab = 'Frequ?ncia Relativa',
     xlab = 'N?veis de S?dio',
     main = 'Histograma Relativo aos n?veis de s?dio dos pacientes  \n com insufici?ncia cardi?ca',
     freq = FALSE) ## desativo a frequencia
#o histograma lembra bastante a distribui??o normal, fazendo para saber a varivel resposta.



##### boxplot
boxplot(db$Sodium~db$BP, ##SEGUNDO ARGUMENTO 'DB$BP', ANALISANDO GRAFICOS EM DUAS VARIAVEIS
        main = 'Boxplot referente aos n?veis de s?dio dos pacientes  \n com insufici?ncia cardi?ca',
        pch = 19, ##bolinhas
        ylab= 'N?veis de S?dio',
        xlab = 'Press?o alta')


####### 

grafbox <- list()
for(i in 9:13)
  
  
  box()



################################################################################################
### grafico de setores
##(percentual)


# leitura dos dados
data(mtcars)
db.mtcars <- mtcars

#visualização dos dados
head(db.mtcars, n = 10)


## uso da função pie(), responsavel por gerar grafico de setores, ela trabalha com tabela de frequencia.
cyl <- table(db.mtcars$cyl)
cyl


cylpercent <- round(100*cyl/sum(cyl),1) # convertendo 
cylpercent

pie(cyl, main = 'grafico de setores: numero de cilindros',
    col = c('pink','blue','red'),
    border = 'white',
    labels = paste(cylpercent,'%')
)
legend('topright', 
       fill = c('pink','blue','red'),
       legend = c('4 cilindros','6 cilindros','8 cilindros'),
       bty = 'n',
       title = 'Número \n cilindros')

#########################################################
## grafico de linhas

data(Nile)
db.Nile <- Nile

# visualiza dados
head(db.Nile, n = 100)

# uso da função plot()
plot(db.Nile, type = 'o', pch=19)

##################################################################
## grafico de dispersao

plot(db$Creatinine~db$Sodium, main = 'Diagrama de Dispersão',
     xlab='Sodium', 
     ylab = 'Creatinine', pch = 19,col = c('red'))