#Clase del 08/06/2023

#Leer archivos
setwd("C:\\Users\\CC7\\Downloads")
contaminacion <- read.csv("contaminacion.csv")

#Crea una tabla de los datos, solo es visual, mejora  
View(contaminacion)
is.na(contaminacion)
complete.cases(contaminacion)#Un valor por cada registro
na.omit(contaminacion)#Omite las filas que tienen valores vacíos

#Complete cases, negado nos devuleve si dentro de las filas hay celdas vacias 
contaminacion[!complete.cases(contaminacion),]

install.packages(mice)
library(mice)

maraton <- read.csv("maraton_ny.csv")

md.pattern(maraton)
md.pattern(contaminacion)

duplicated(contaminacion)

contaminacion[duplicated(contaminacion),]

#Técnicas para la limpieza de datos
#Se le conoce como data imputation -> que es llenarlos 
#Al proceso reemplazar los datos incompletos o valores faltantes
#Para ello exiten distintas ´tecnicas, entre las que se encuentran: 
#Promedio
#Moda
#Vecinos cercaos -> Los valores más acercados al registro

sum(contaminacion$CN) #-> Si sumas valores enteros con vacíos, obviamente te van a dar null

sum(contaminacion$CN, na.rm = TRUE)# na.rm remueve a los vacíos

contaminacion$CN_p <- ifelse(is.na(contaminacion$CN),#Busca los vacíos
                               mean(contaminacion$CN, na.rm = TRUE),#LOs rellena con el promedio
                             contaminacion$CN)#Los valores que no estan vacíos les pone el mismo valor

contaminacion

install.packages("modeest")
library("modeest")

mfv(contaminacion)

#Promedio cuando haya datos numericos y moda con text
b <- data.frame(v1 = c("a","b","c","d"), v2 = c("hola","hola",NA,"adios"))
b$v2_moda <- ifelse(is.na(b$v2), mfv(b$v2, na_rm=TRUE), b$v2)
b

#Vecinos cercanos
#K-nearet Neighbors (KNN)
#método de clasificación supervisado que calcular la dsitancia entre los elementos
#a clasificar y el resto de los elementos en el dataset de entrenamiento