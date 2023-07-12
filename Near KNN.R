#Algoritmo de aprendizaje supervisado
#Se dividen en 2 tareas predición (regresión) y clasficicacion(KNN)

View(iris)

irisCopia <- iris
datos <- iris

View(datos)
#Verificar que el data set sea un data frame
class(datos)
# datos <- as.data.frame(datos)

#Verificar que la columna de clasificación sea un factor
class(datos$Species)
#datos$Species <- as.factor(datos$Species)  -> Así se convierte si no es un factor
#Factor es un enumerador o catalogo de bd de java

#Los algoritmos de clasificación son sensibles a los 
#cambios de magnitud de variables
# ES NECESARIO ESCALAR
# datos$Sepal.Length
# <- scale(datos$Sepal.Length)
datos[,1:4] <- scale(datos[,1:4]) #reescala las primeras 4 columnas
View(datos)
#El rescalamiento de más de una columna es normalización, rehace la escala


# 80/20, 70/30
# Si tienes un data set de 150 observaciones
# 120 observaciones de entrenamiento
# 30 observaciones de prueba
tam_train <- floor(0.8 * nrow(datos)) #120
#Floor redondea hacía abajo y 0.8 es la cantidad de datos en este caso es el 80%

# Extraer la cantidad de elementos calculada (120)
# del conjunto de datos original
# Función sample: Obtiene una muestra (algunos elementos)
# Aleatoria de un conjunto de datos
# Funcion seq_len: generar enteros desde 1 hasta que indiques
#Generar una secuencia de enteros del 1 al 150
secuencia <- seq_len(nrow(datos))#Es para sacar el tamaño total
class(secuencia)
#Elige 120 números de la secuencia, de manera aleatoria
indices_train <- sample(secuencia, size = tam_train)
#tam_train son los 120 datos que hacer un rato estraimos, esos son los que va a usar

#El data set de entrenamiento y prueba no deben contener
# la columna de clasificación
datos_train <-datos[indices_train,1:4] #80% -> Saca todas las filas que vamos a usar para entrenas

# Tiene el negativo por que va a traer los datos de prueba, que son el 20%
datos_test <-datos[-indices_train,1:4] #20% -> este significa traeme todos los valores que no trajiste en la anterior


# la clasifiación siempre se quita, que es la que ponemos abajo 
# datos [,1:4]
# datos [,c(2,4)]
clase_train <- datos[indices_train,5]#Este es para traer las clasificaciones del 80%, solo la clasificación, la 5ta columna
clase_test <- datos[-indices_train,5]#Esto nos trae los restantes pero el 20%, solo la clasifiacación, la 5ta columna

dim(datos_train)
class(clase_train)

#Se crea el modelo de clasificación con la función Knn
# de la libería class
install.packages("class")
library(class)
#Conkunto de entrenamiento
#Conjunto de prueba
#Clasifiación del conjunto de entrenamiento
#El valor de k (cuantos vecinos)
# k = cantidad de observaciones / 2 X
# k = sqrt(cantidad de observaciones)
# k se recomienda impar
# el resultado de ejecutar knn es la clasificacion
# de los valores de entrenamiento

clasificacion <- knn(datos_train,
                     datos_test,
                     clase_train,
                     k=sqrt(nrow(datos)))

#Ahora vamos a verificar si realmente esta bien la clasificación de los datos
datos_train
datos_test

#Almacenar los datos de prueba con la clasificación del algoritmo
datos_test_clasificacion <- datos_test
datos_test_clasificacion$Clase <- clasificacion
View(datos_test_clasificacion)
install.packages("ggplot2")
library("ggplot2")

ggplot (datos_test_clasificacion,#  Datos
        aes(x=Sepal.Length, y= Sepal.Width,#Valores esteticos
            color = Clase, fill = Clase)) + 
  geom_point(size = 7) + #Dibujar un punto por cada valor que le damos
  geom_text(aes(label = Clase)) + ##Agrega la clasificacion a cada punto
  theme(legend.position = "none") # quitar la clasificacion del lado derecho

#Matriz de confusion
# Tabla de todos contra todos
tab <- table(clasificacion, clase_test) #Verifica lo que hace knn contra lo real, si vemos tab, aparece la matriz de confusion
diag(tab) #La suma de la diagonal
rowSums(tab) #Suma todas las columnas
# val.clasificados correctmanete / total val
# accuracy / precisión
accurancy <- function(tabla){
  sum(diag(tabla)/sum(rowSums(tabla)))*100
}

accurancy(tab)
