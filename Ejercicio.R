#Comentarios en general, SIEMPRE debes de marcar el código que vas a utilizar
#Los tipos de datos son el LOGICAL, CHARACTER, NUMERIC, FACTOR, MATRIX, VECTOR es la lista pero manda numeric,
#LIST, DATAFRAME
#DATAFRAME ES un conjunto de vectores
#Las observaciones son registros
#Las columnas son variables
precio = 100

if(precio < 100){
  print("Es menor a 100")
}else{
  print("Es mayor a 100")
}

quantity <- c(1,1,2,1,2)
#C es de combine, que va a crear multiples elementos, como una lista
#Es un For ternario, ejecuta un ciclo en cada dato de la lista de quantity
ifelse(quantity == 1, 'Yes','No')

#Si tenemos una lista, el if no funciona, solo podemos comparar un valor
price <- c(58,100,110)
if(price < 100){
  print("Es menor a 100")
}else if(price == 100){
  print("Es igual a 100")
}else{
  print("Es mayor a 100")
}

#Aquí tenemos dos if, el primero no se ejecuta por que no todos los valores son menores a 100
#El segundo método si se ejecuta por que es any, o sea que si hay al menos 1 valor que es menor a 100
price <- c(58,100,110)
if(all(price<100)){
  print("Todos son <100")
}

if(any(price<100)){
  print("Algun es <100")
}

#Es un switch normal, pero en weekend solo si tecleamos el numero 6 sale weekedn, no funciona como un default
days <- function(x){
  switch(x,
         Mon = "Monday",
         Tue = "Tuesday",
         Wed = "Wednesday",
         Thu = "Thursday",
         Fri = "Friday",
         "Weekend"
         )
}

days("Mon")
#Sale friday por que esta en la posicion 5
days(6)


#mean es la media o sea el promedio, es una palabra reservada
#prod también es una palabra reservada
quantity <- c(1,2,3,4,5)
avg_qty <- function(qty, type){
  switch(type,
         arithmetic = mean(quantity),
         geometric = prod(quantity)^(1/length(quantity)))
}

avg_qty(quantity, "arithmetic")
avg_qty(quantity, "geometric")


cart <- c("apple","cookie","lemon")
for(product in cart){
  print(product)
}

#price_discounted solo tiene un valor y price tiene 9, es posible asignarle 9 valores si solo tiene 1? Si, se puede
price_discounted <- c(1)
price <- c(30,120,50,70,150,100,50,25,110)
for(i in 1:length(price)){
  price_discounted[i] <- price[i] - price[i] * 0.1
  print(price_discounted[i])
}

#El while funciona igual, solo que paste es concatenar, y no, no se puede hacer un ("Index is" + index)
#Es necesario usar el paste
index <- 1
while(index < 3){
  print(paste("Index is", index))
  index <- index + 1
}  

#Es un ciclo infinito, pero con el if le damos un tope para que no se pase
#El if es el tope, y este es como un do while
x <- 1
repeat{
  print(x)
  x <- x + 1
  if( x == 3){
    break
  }
}

#Leer archivos
setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,#Nombre de las columnas
                    row.names = 1, #Las filas tienen un nombre
                    sep = ",", 
                    dec = ".")

#Crea una tabla de los datos, solo es visual, mejora  
View(maraton)

#Nos dice el tipo de variable que es
class(maraton)

#nos da primero las columnas y luego las filas
dim(maraton)

#devuelve los encabezados de las columnas 
names(maraton)

#devuelve la estructura de los datos y sus tipos de daotos de los encabezados
str(maraton)

#Devuelve el numero de filas
nrow(maraton)

#Instala las depedencias
install.packages("dplyr")

#Es como el use
library("dplyr")

#Es propio de dplyr y hacer lo mismo que str pero más bonito
glimpse(maraton)

#Resumen de la información 
summary(maraton)

#Es para ver los primeros registros de nuestro dataframe, podemos especificar cuantos
#Si no solo dejamos sola sin el numero
head(maraton , 3)

#Es para ver los últimos 3, aplica lo mismo de arriba

tail(maraton, 3)

install.packages("RWeka")
library("RWeka")

datos <- read.arff("CEE_DATA.arff")




