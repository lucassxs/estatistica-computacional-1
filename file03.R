#### Bubble Chart###########

###install
install.packages("ggplot2")
install.packages("dplyr")
install.packages("hrbrthemes")
install.packages("plotly")

library(ggplot2)
library(dplyr)
library(hrbrthemes)
library(plotly)

#criar a base de dados (disponível no github pelo site do plotly)
data <- read.csv("https://raw.githubusercontent.com/plotly/datasets/master/gapminderDataFiveYear.csv")

head(data)

#cria base de dados de 2007

data_2007 <- data[which(data$year==2007),]
data_2007 <- data_2007[order(data_2007$continent, data_2007$country),]

slope <- 0.00005

data_2007$size <- sqrt(data_2007$pop * slope)
head(data_2007)

colors <- c('#4AC6B7','#1972A4','#965F8A','#FF7070','#C61951')

## Fazer grafico

# uso da função plot_ly():
##### DEFINE FORMA DA FIGURA
fig <- plot_ly(data_2007, # base de dados
               x = ~gdpPercap, # renda per capita
               y = ~lifeExp, # expecativa de vida
               color = ~continent, #variável que irá definir as cores
               size = ~size, # tamanho dos circulos (baseado no tamanho amostral)
               colors = colors, # vetor com as cores
               type = 'scatter', # grafico de pontos
               mode = 'markers', # tipo de marcador
               sizes = c(min(data_2007$size), max(data_2007$size)), #maximo e minimo dos graficos
               marker = list(symbol = 'circule',
                             sizemode = 'diameter',
                             line = list(width = 2, color = '#FFFFFF')),
               text = ~paste('Country:', country,
                             '<br>Life Expectancy:', lifeExp,
                             '<br>Pop.:', pop))
##### DEFINE LAYOUT DO GRAFICO
fig <- fig %>% layout(title = 'Life Expectancy vs Per Capita GDP, 2007',
                      xaxis = list(title = 'GDP per capita (2000 dolars)',
                                   gridcolor = 'rgb(255,255,255)',
                                   range = c(2.003297660701705, 5.191505530708712),
                                   type = 'log',
                                   zerolinewidth = 1,
                                   ticklen = 5,
                                   gridwidth = 2),
                      yaxis = list(title = 'Life Expectancy (years)',
                                   gridcolor = 'rgb(255,255,255)',
                                   range = c(36,92),
                                   zerolinewidth =1,
                                   ticklen = 5,
                                   gridwidth =2),
                      paper_bgcolor = 'rgb(243,243,243)',
                      plot_bgcolor = 'rgb(243,243,243)')


fig



############################################################################
##### grafico da covid

# definir diretorio de dados
setwd("/Users/User/Desktop/arquivo")

## leitura dos dados (dataset: heart)
db <-read.csv('owid-covid-data.txt',header = TRUE, sep = ',')

head(db, n = 10) # visualiza dados
dim(db) # dimens?o dos dados
str(db) # estrutura


# data_country <- db[which(db$continent==),]
db <- db[order(db$continent, db$total_cases),]

slope <- 0.00005


