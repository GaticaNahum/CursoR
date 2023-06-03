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

