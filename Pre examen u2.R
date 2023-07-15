setwd("C:\\Users\\cc7\\Desktop")

cerebros <- read.csv("cerebros.csv", 
                   header=TRUE,
                   sep=",",
                   dec=".")

modeloCerebros <- lm(IQ ~ Tamano_del_cerebro + Altura_en_metros, data = cerebros) #Multiple

iq = 203.066 + 1.251 * Tamano_del_cerebro - 2.935 * Altura_en_metros
 #  Intercept  tamano  esta variable es    valor de     variable como tal
  #            tabla                      la altura
  #                                      de la columna
#Resumen, los primeros dos valores son los que salieron del lm
#los valores de Intercept y el de tamano del cerebro, se suman
#luego se multiplican por el valor de la columna tamano_del_cerebro
#luego se pone el valor de lm, el tercer valor de altura por lo que es - 2.935
#y por último se mutiplica por la altura_en_metros, la columna y NO el valor de lm

