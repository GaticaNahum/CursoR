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