#PCA
# Principal Component analysis
# n-1 componentes
#cada componente es una función

datos <- USArrests

View(datos)

install.packages("stats")
library("stats")

pca <- prcomp(datos, center = TRUE, scale = TRUE)
pca
summary(pca)

PC1 = -0.5358995*datos$Murder-0.5831836*datos$Assault-0.2781909*datos$UrbanPop-0.5434321*datos$Rape
PC2 = 0.4181809*datos$Murder+0.1879856*datos$Assault-0.8728062*datos$UrbanPop-0.1673186*datos$Rape
PC3 = -0.3412327*datos$Murder-0.2681484*datos$Assault-0.3780158*datos$UrbanPop+0.8177779*datos$Rape
PC4 = 0.64922780*datos$Murder-0.74340748*datos$Assault+0.13387773*datos$UrbanPop+0.08902432*datos$Rape

pc1 <- apply(pca$rotation[,1]*datos,1,sum)
pc2 <- apply(pca$rotation[,2]*datos,1,sum)
pc3 <- apply(pca$rotation[,3]*datos,1,sum)
pc4 <- apply(pca$rotation[,4]*datos,1,sum)

datospca <-data.frame(cbind(PC1,PC2,PC3,PC4))
View(datospca[,1:2])

summary(pca)
