#Carga los datos del archivo AB_NYC_2019.csv.
setwd("C:\\Users\\cc7\\Downloads")
NYC <- read.csv("AB_NYC_2019.csv", header= TRUE,row.names = 1,sep = ",", dec = ".")

#¿Cuántas observaciones cuentan con valores vacíos?
install.packages("mice")
library("mice")
nrow(na.omit(NYC))
sum(NYC == "")

#Elimina las observaciones que cuenten con valores vacíos.
NCYLimpio <- na.omit(NYC)

#Con el data set original, llena los valores vacíos de las columnas last_review con moda y review_per_month con promedio.
NYC$last_review <- ifelse(NYC$last_review == "",
                          NA,
                          NYC$last_review)

NYC$reviews_per_month <- ifelse(NYC$reviews_per_month == "",
                          NA,
                          NYC$reviews_per_month)
View(NYC$last_review)
install.packages("modeest")
library("modeest")

NYC$last_review <- ifelse(is.na(NYC$last_review),
                          mfv(NYC$last_review, na_rm=TRUE),
                              NYC$last_review)

NYC$reviews_per_month <- ifelse(is.na(NYC$reviews_per_month),
                          mean(NYC$reviews_per_month, na.rm=TRUE),
                              NYC$reviews_per_month)
#¿Cuántos valores atípicos tiene la columna number_of_reviews?
length(boxplot.stats(NYC$number_of_reviews)$out)

#¿Cuántas propiedades existen por cada neighbourhood?
resumen <- sum(nlevels(factor(NYC$neighbourhood)))

#¿Cuántos y cuáles room_types existen?
tipos <- factor(NYC$room_type)
nlevels(tipos)

#¿Cuántas propiedades existen con precios de renta entre 5000 y 7500?
install.packages("dplyr")
library("dplyr")
nrow(NYC %>% filter(price > 5000 & price < 7500))

#EXTRA: Con base en el precio de renta, crea una columna nueva llamada precio que asigne una categoria (caro, medio, económico) 
#a cada propiedad.
NYC$price_new <- cut(NYC$price, breaks=3,labels=c("caro","medio","económico"))


