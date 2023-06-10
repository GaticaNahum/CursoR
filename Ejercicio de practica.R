numeros <- c(20:50)


print("El promedio es: ")
mean(numeros)

print("Calcular la suma")
sum(numeros)

print("Primer vector")
a <- c(1,2,3)

print("Segundo vector")
b <- c(3,4,5)

print("Tercer vector")
c <- c(6,7,8)

#rbind y cbind
matriz <- rbind(a,b,c)

#Matriz
matrix <- matrix(c(a,b,c),
                 nrow = 3, ncol =3, #Nombre filas y de columnas
                 byrow = TRUE, #Es para ordenalos por fila, si es false es por columna
                 dimnames = list(
                   c("row1","row2","row3"), #nombres de filas
                   c("C.1","C.2", "C.3")))  #Nombres de columnas

setwd("C:\\Users\\CC7\\Downloads")
pizzas <- read.csv("pizzaplace.csv",
                  header = TRUE,#Nombre de las columnas
                  sep = ",", 
                  dec = ".")
View(pizzas)

print("Obtener los distintos tipos de pizza")
tipos <- factor(pizzas$type)
nlevels(tipos)

#Obtener la pizza mas cara
pizzas[which.max(pizzas$price), 5]

#Cual es el tamaño de la pizzas que se vende menos
install.packages("dplyr")
library("dplyr")

#Obtener el conteo de todos los tamaños de las pizzas
pizzas%>%count(size) #Devuelve un filas y columnas
#Arrange es para ordernar los datos, se usa n por las columnas del anterior código
#[filas, columnas]
(pizzas%>%count(size) %>% arrange(n))[1,"size"]
#Esto indica  %>% que va a mandar el resultado de los resultados anteriores al que sigue

#Mostrar las pizzas vendidas de marzo a abrirl solo pizzan grandes
#Con dplyr
View(pizzas %>% filter(size == "L"
                       & as.Date(date) >= '2015-03-01'
                       & as.Date(date) <= '2015-04-30'))

#Sin dplyr
pizzas[pizzas$size == "L" & substr(pizzas$date,6,7) == "03"
       | substr(pizzas$date,6,7) == "04",]

#Ventas realizadas en agosto
resultado <- pizzas %>% filter(as.Date(date) >= '2015-08-01' & 
                  as.Date(date) <= '2015-08-31') %>% select (name, size)
View(resultado)
# yA AMONOS

#sin dplyr
pizzas[pizzas$date >= '2015-08-01' & pizzas$date <='2015-08-31', c(5,6)]

pizzas[substr(pizzas$date,6,7) == "08", c(5,6) ]

#Cual es el horarario de atención de la pizzeria
minimo <- min(pizzas$time)
maximo <- max(pizzas$time)
print(paste(minimo, "-",maximo))