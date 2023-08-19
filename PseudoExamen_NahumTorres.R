#Torres Gatica Erick Nahum
set.seed(123)
datos <- data.frame(
  x = c(runif(20, 0, 10), runif(20, 20, 30)),
  y = c(runif(20, 0, 10), runif(20, 20, 30))
)
View(datos)
#2.- Escalar los datos 
datos <- scale(datos[,c(1,2)])

#3.- Determinar el número de clusters
library(NbClust)
library("factoextra")
clusters <- NbClust(datos, distance = "euclidean",
                    min.nc= 2, max.nc = 10, method = "kmeans",
                    index = "alllong")

# a) Calcula el valor de k óptimo para los datos proporcionados.
# R= 2

# b) Agrega al dataset original los valores del grupo asignado por el algoritmo.
agrupamiento <- kmeans(datos, 2)
set.seed(123)
datos <- data.frame(
  x = c(runif(20, 0, 10), runif(20, 20, 30)),
  y = c(runif(20, 0, 10), runif(20, 20, 30))
)
datos$cluster <- agrupamiento$cluster
#c) Gráfica los grupos generados por el algoritmo kmeans.
fviz_cluster(agrupamiento, data = datos,
             ellipse.type = "norm",
             palette = "Set2", ggtheme = theme_minimal())
#d) ¿Cuál es el propósito del algoritmo k-means?
# R= Particionar n objetos en k clusters

#e) ¿Qué significa el parámetro 'k' en el algoritmo k-means?
#R = La cantidad de clusters adecuados para la información

#2. Ejecuta el siguiente código para generar el dataset que utilizarás para el ejercicio.

set.seed(456)
data <- data.frame(
  x1 = c(rnorm(30, 0, 2), rnorm(30, 5, 2)),
  x2 = c(rnorm(30, 0, 1), rnorm(30, 5, 1)),
  x3 = c(rnorm(30, 0, 3), rnorm(30, 5, 3)),
  x4 = c(rnorm(60, 10, 2)),
  x5 = c(rnorm(60, -5, 1))
)

#a) Realiza la reducción de dimensionalidad utilizando PCA.
library("stats")
pca <- prcomp(data, center=TRUE, scale = TRUE)
pca
summary(pca)

#b) ¿Cuál es la proporción de la varianza explicada por cada componente?
# PC1    PC2    PC3    PC4     PC5
#0.4271 0.2656 0.1398 0.1109 0.05656

#¿Cuántos componentes principales deberían seleccionarse si se desea explicar al menos el 95% de la varianza total de los datos?
# R = Los 5 componentes principales
#                        PC1    PC2    PC3    PC4     PC5
#Cumulative Proportion  0.4271 0.6927 0.8325 0.9434 1.00000

#d) Añade los componentes seleccionados al dataset original.
PC1 = 0.59342661*data$x1+0.61289827*data$x2+0.51418108*data$x3+0.08618716*data$x4-0.01975221*data$x5
PC2 = -0.00247124*data$x1-0.04479897*data$x2+0.19837013*data$x3-0.68826588*data$x4+0.69636650*data$x5
PC3 = 0.09952601*data$x1-0.05764651*data$x2-0.13332023*data$x3+0.68259021*data$x4+0.70927271*data$x5
PC4 = 0.47250612*data$x1+0.25604820*data$x2-0.81123727*data$x3-0.22925578*data$x4+0.02265284*data$x5
PC5 = -0.64394975*data$x1+0.74395225*data$x2-0.14278271*data$x3+0.01934521*data$x4+0.10536896*data$x5

data$PC1 <- PC1
data$PC2 <- PC2
data$PC3 <- PC3
data$PC4 <- PC4
data$PC5 <- PC5


View(data)

