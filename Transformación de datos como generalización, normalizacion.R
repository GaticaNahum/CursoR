#Generalización
#Transformación de datos

setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv")

#Este es pára generalizacion
#Ordena los datos de mayor a menos y hace cortes y los clasifica con las más altos para alto y así
#consecutivamente, siempre es de menor a mayor
maraton$nivel <- cut(maraton$time, breaks=3,labels=c("alto","medio","bajo"))

View(maraton)


#Reescalamiento

install.packages("scales")
library("scales")
setwd("C:\\Users\\CC7\\Downloads")
data_conv <- read.csv("data-conversion.csv")

#Rescalar con formula
(data_conv$Age-min(data_conv$Age))/(max(data_conv$Age)-min(data_conv$Age))

#La formula para rescalar es x-(xmin)/(xmax-xmin)

#REscalar con librearia
rescale(data_conv$Age)+
  

#Normalización
#La formula es (x-media)/std.dev.
setwd("C:\\Users\\CC7\\Downloads")
salary <- read.csv("salary.csv")
salary

grafica <- (scale(salary[,c(1,2)]))
plot(salary)
plot(grafica[,2])

#smoothing
install.packages("modelbased")
library("modelbased")

#Solo gráficar la función sen con todos los valores
#Sin es seno
#lo de adentro son valores, valores que va a generar y solo va a generar 100 valores
#100 valores de 0 a 4 * pi
#el rnorm son los valores de la distribución normal, valores pequeños
x <- sin(seq(0, 4* pi, length.out = 100)) + rnorm(100,0,0.2)
plot(x, type = "l") #COn la l nos lo pone en líneal

#Lines permite agregar lineas a la gráfica con plot
#Añadir una linea que va a lisar los valores de x, smooth es una forma de hacer el suavizado
#
lines(smoothing(x,method = "smooth"), type = "l", col = "blue")
lines(smoothing(x,method = "loess"), type = "l", col = "red")

