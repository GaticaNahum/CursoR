#Parte 1. Calculcar el promedio, suma y la media geometrica de las calificaciones
calificaciones <- c(9.3,9.6,9.4,9.2,9.1,9.0,9.2)

print("Calcular el promedio")
promedioTotal = mean(calificaciones)

print("Calcular la suma")
sumTotal = sum(calificaciones) 

print("Calcular la media geométrica")
mediaGeometrica = prod(calificaciones)^(1/length(calificaciones))

#Parte 2. Calcular los volumenes de las siguientes figuras
pi = 3.1416

calcularVolumen <- function( b, a, h, type){
  switch(type,
         cilindro = (b*(a^2))*h,
         prismaRectangular = b*a*h,
         prismaTriangular = ((b*a)/2)*h,
  )
}

calcularVolumen(pi,5,6, "cilindro")
calcularVolumen(5,4,1, "prismaRectangular")
calcularVolumen(3,5,15, "prismaTriangular")

