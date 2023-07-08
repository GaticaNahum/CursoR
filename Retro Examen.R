#Retro alimentación del examen

#1.
#Carga los datos del archivo en un data frame.
setwd("C:\\Users\\erick\\Downloads")
movies <- read.csv("movies.csv", 
                   header=TRUE,
                   sep=",",
                   dec=".")

movies$VOTES <- ifelse(movies$VOTES=="", #Busca los valores vacíos
                       NA, #Los remplaza con NA
                       movies$VOTES) #Llena la columna de Votes

movies$Gross <- ifelse(movies$Gross=="", 
                       NA,
                       movies$Gross)
View(movies)
#Verifica si existen valores faltantes.
install.packages("mice")
library("mice")
md.pattern(movies) #Para ver la tabla
str(md.pattern(movies)) #Para conocer las dimensiones

#¿Cuántos valores faltantes existen en el dataframe?
md.pattern(movies)[6,7] #6 y 7 por que son las dimesiones que nos da con str(md.pattern(movies))

#Guardar en un nuevo dataframe las observaciones que no tiene datos faltantes.
moviesSinFaltantes <- na.omit(movies)
View(moviesSinFaltantes)

#Sustituye los valores faltantes de las columnas rating y votes, con las técnicas de promedio y moda, respectivamente.

install.packages("modeest")
library("modeest")

movies$RATING <- ifelse(is.na(movies$RATING),
                        mean(movies$RATING, na.rm = TRUE),
                        movies$RATING)

movies$VOTES <- ifelse(is.na(movies$VOTES),
                        mfv(movies$VOTES, na_rm = TRUE),
                        movies$VOTES)
View(movies)

#Sustituir valores faltantes de la columna runtime con la técnica de vecinos cercanos.
install.packages("DMwR2")
library("DMwR2")
movies <- knnImputation(movies) #No funciona por que no hay suficientes datos

#2.
#Visualiza mediante las gráficas de caja los valores atípicos para las columnas view y comments.
post_data <- read.csv("post-data.csv", 
                      header=TRUE,
                      sep=",",
                      dec=".")
boxplot(post_data$views)
boxplot(post_data$comments)
#De acuerdo con las estadísticas de las gráficas de caja, ¿cuántos valores atípicos tiene cada columna?
length(boxplot.stats(post_data$views)$out)
length(boxplot.stats(post_data$comments)$out)

#Elimina los valores atípicos de views y comments.
quitarAtipicos <- function(vector){ ##Función que recibe un vector y lo limpia de valores atipicos
  variable <- boxplot.stats(vector)
  nuevo <- vector
  while(length(variable$out) > 0){
    inferior <- variable$stats[1]
    superior <- variable$stats[5]
    nuevo <- vector[vector < superior & vector > inferior]
    variable <- boxplot.stats(nuevo)
  }
  return(nuevo)
}

viewSinAtipicos <- quitarAtipicos(post_data$views)#Mandamos a llamar a la funcion y
boxplot(viewSinAtipicos)#recibimos en viewSinAtipicos los valores limpios sin atipicos

commentsSinAtipicos <- quitarAtipicos(post_data$comments)
boxplot(commentsSinAtipicos)

#¿Cuántas y cuáles categorías existen en el dataset?
tipos <- factor(post_data$category)#Nos da los tipos
nlevels(tipos) #Nos da el numero de categorias de lo anterior

#¿Cuál es la categoría con mayor cantidad de comentarios?
install.packages("dplyr")
library("dplyr")
resumen <- post_data %>%
  group_by(category) %>%
  summarize(total_comments = sum(comments))

resumen[which.max(resumen$total_comments),1]

resumen %>% slice_max(order_by = total_comments) %>%
  pull(category)

#En promedio, ¿cuántas vistas tiene la categorìa Visualization?.

post_data %>% filter(category=="Visualization") %>% summarize(mean(views))
mean(post_data$views[post_data$category == "Visualization"],)

