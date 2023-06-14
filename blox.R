#Clase de vecinos cercanos 13/06/2023
#Buscar los incompletos
#eliminarlos o rellarlos de que manera:
  #promedios para numeros
  #moda para textos
#Se usa knnImputatuin del paquete DMwR
#Se realizac on el data fram original y se aplica a todas las columnas

install.packages("DMwR2")
library("DMwR2")
setwd("C:\\Users\\CC7\\Downloads")
contaminacion <- read.csv("contaminacion.csv")


#Agrupa los numeros en categoria y saca el promedio de la categoria que se parezcan
kcontamincacion <- knnImputation(contaminacion)
kcontamincacion

#Valores atípicos
#Un valor atípico es una observación que es numéricamente distante del resto de los datos
#2.5 es el limite de los datos que son útiles
#Valores atípicos son datos muy raros dentro de una población
#Quitar los valores atipicos ya que pueden dar más favor hacía una u otra dirección

rivers

#Es para ver en gráficas
plot(rivers)
#Para verlo con bigotes  todo eso xD
boxplot(rivers,horizontal = TRUE)
#Debemos de saber el valores los bigotes antes de eliminar los atípicos
#te da stats, n, conf, out
boxplot.stats(rivers)
#$n, numero de registros
#$confg -> los valores que más se repiten
#$out los valores fuera de los bigotes, los valores atipicos
#stats son los limites por ejemplo

stats <- boxplot.stats(rivers)
inferior <- stats$stats[1]
superior <- stats$stats[5]

#o
data<-rivers[rivers < superior & rivers > inferior]

cantidad <- stats$out;
boxplot(rivers)

variable <- boxplot.stats(rivers)
nuevo <- rivers
while(length(variable$out)>0)
  inferior <- variable$stats[1]
  superior <- variable$stats[5]
  nuevo<-nuevo[nuevo < superior & nuevo > inferior]
  variable <- boxplot.stats(nuevo)
}
boxplot(nuevo)

