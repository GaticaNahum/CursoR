#Leer archivos
setwd("C:\\Users\\CC7\\Downloads")
maraton <- read.csv("maraton_ny.csv",
                    header = TRUE,#Nombre de las columnas
                    row.names = 1, #Las filas tienen un nombre
                    sep = ",", 
                    dec = ".")

View(maraton)

#Ctrl + l -> Para limpiar la consola

#También existe el assing para asignar variables
assign("z",3)

#Asignación de un tipo de datos
r <- numeric(10) #asigna 10 variables de valor numerico, como crear un arreglo asignado en 0
r[1]

c <- character(10)

#Modulo en r es 
5%%2

#División decimal solo es /
10/7

#división entera solo es %/%
10%/%7

x=2
#Comparaciones solo es para and & y para or es |, en vez de ser dos solo es uno
x == 3 & x < 6

# Tipos de datos
#Caracter, numero (double, integer)
#Logico (boolean), complejos, raw
edad <- 34L

raiz <- 3+5i #Tipos complejos
binarios <- raw(2)# Para tipos que no estan en R como imagenes o tipos, es un arreglo de bytes

typeof(raiz) #Es como class

?class #Es para que el IDE nos de información, busca un concepto relacionado
??graph #Buscamente todos los conceptos en los que encuentres esta palabra

fun1 <- function(x, aritmetic=T){
  if(is.character(x) | is.logical(x)){
    print("El argumento no es numerico")
  }else{
    if(aritmetic == T){
      sum(x) / length(x)
    }else{
      prod(x) ^ (1 / length(x))
    }
  }
  return ("Cualquier cosa")
}

fun1(c(1,2,3), T)


#Si tienes un arreglo con distintos tipos de datos, siempre va a utilizar el más grande

# utilizar el operador para rangos 1:5, va de 1 en 1
d <- 1:5

#Utilizando la función seq, podemos especificar que vaya de 1.5 en 1.5 

e <- seq(1,5, by=1.5)

#replicando elementos,repite del 2-4, 4 veces
f <- rep(2:4, times=4)

#Utiliza la funcion scan, por default es para numeros
g <- scan()

#Asignar encabezado a un vector
vector <- c(1,2,3,4)
names(vector) <- c("Posicion1" ,"Posicion2", "Posicion3")
vector

#Crear un vector con clave
inventario <- c('manzana'=30, 'perro'=3)

#Añadir más elementos
inventario2 <- c(inventario, 'pera'=10)

#Añadir más elementos
inventario3 <- union(inventario, c('manzana'=30))

inventario <- c("Manzana", "Pera", "Naranja")

#Selección de elementos dentro de un vector
inventario[2]
inventario[1:2]

#Para seleccionar posiciones que no están contignuas
#Solo muestra el 1 y el 3
inventario[c(1,3)]
#Muestra todos menos el 3
inventario[-3]
inventario[-(2:3)]
inventario['Manzana']

#Para quitar un elemento especifico
#Es para quitar una posición especifica
inventario <- inventario[-3]


inventario <- c("Manzana" =10, "Pera"=20, "Naranja"=30)
#Selección por filtrado
inventario
inventario[ inventario < 25]
inventario[ inventario == 10]
inventario[ inventario %in% c(10,20,25)]
inventario[ inventario %in% 2:30]

#Leer archivos
setwd("C:\\Users\\CC7\\Downloads")
casas <- read.csv("house_rental.csv",
                    header = TRUE,#Nombre de las columnas
                    sep = ",", 
                    dec = ".")
View(maraton)

#Seleccionar una columna individual
maraton$age
maraton$gender

#Fila 3, columna 4, devuelve la fila 3 y la columna 4
maraton[3,4]

# 10 primeras filas, 2 primeras columnas
maraton[1:10,1:2]

#Todas las filas, solo columnas 1,5
maraton[ , c(1,5)]

#Solo fila 1 y 100, todas las columnas
maraton[1,100, ]

#Filas del 1 al 100, todas las columnas
maraton[1:100, ]

#Corredores cuyo genero es femenino
#DEvuelve las filas dónde la columna de gender es igual a female
View(maraton[maraton$gender=='Female',])

max(maraton$age)
min(maraton$age)
mean(maraton$age)
max(maraton$time)
View(maraton[ ,-3])
nrow(maraton)
dim(maraton)

#Conocer la dimensión de un objeto
dimension <- dim(maraton)
typeof(dimension)
str(dimension)
#Para filas por que así lo muestra dim
dimension[1] 
#Columnas
dimension[2]
#o junto
dim(maraton)[1]
#Obtener el rank de los valores de una
?rank
View(rank(maraton$time))
rank(inventario)
inventario

#Obtener key y posición del elemtno MAX o Min
#Devuelve el indice donde se encuentra el valor más grande
which.max(maraton$age)
maraton[106, ]
wich.min(maraton$time)
maraton[765, ]
View(maraton)
rm(maraton)
?which.max 

#
View(casas)
sum(casas[casas$Price == c(60000,80000) ,5])

sum(casas[casas$Price>=60000 & casas$Price <=80000,5])
