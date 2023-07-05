#Resolver sistemas de ecuaciones

#Coeficientes a la izquiera del =
a <- matrix(c(19,138,1335,
              138,1335,14935.5,
            1335, 14935.5, 181427), nrow = 3)

b <- matrix(c(649.5,5306.6,51666.75), nrow = 3)

solve(a,b)
#           [,1]
#[1,] -6.6755591
#[2,] 11.7644938
#[3,] -0.6345802

# y = -6.6755591 + 11.7644938*x - -0.6345802*x^2

#linear model
# formula (variables dependientes izquierda, independientes derecha), datos
setwd("C:\\Users\\cc7\\Downloads")
datos <- read.csv("resistencia.csv")
# y = b0 + b1*x
#Resistencia y concentración son columnas
modelo <- lm(resistencia ~ concentracion, data = datos)

#Call:
 # lm(formula = resistencia ~ concentracion, data = datos)

#Coefficients:
 # (Intercept)  concentracion  
#21.321          1.771


datosMarketing <- read.csv("market.csv")
datos <- datosMarketing[1:12,1:3]
modeloMarketing <- lm(Sales ~ Spend, data = datos)#Líneal
modeloMarketing <- lm(Sales ~ Spend + Month, data = datos) #Multiple


datos <- read.csv("resistencia.csv")
modeloMarketing <- lm(resistencia ~ concentracion 
                                    + I(concentracion^2),
                      data = datos)
modeloMarketing <- lm(resistencia ~ concentracion 
                                    + I(concentracion^2)
                                    + I(concentracion^3),
                      data = datos)

#Nos ayuda a calcular los nuevos valores
prediccion <- predict(modeloMarketing, data.frame(concentracion = c(16,17)))
