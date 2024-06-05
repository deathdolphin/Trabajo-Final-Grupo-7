#Se usaran las siguientes librerias para el manejo de datos en la BBDD

library(tidyverse)
library(plotly, ggplot2)

#Carga de la base de datos


library(readr)
Smoker_G7 <- read.csv("C:\\Users\\felixlongart\\Documents\\Rstudio BBDD\\Smoker G7.csv")
View(Smoker_G7)

#Haré múltples dataframes que nos faciliten los cálculos

DF1 <- na.omit(Smoker_G7) %>% 
  filter(current_smoker == "yes")

DF2 <- na.omit(Smoker_G7) %>%
  filter(current_smoker == "no")

DF3 <- na.omit(Smoker_G7)

#Transformaré a las variables "sex" y "current_smoker" en factores para poder graficar.

DF1$sex <- factor(DF1$sex)
DF2$sex <- factor(DF2$sex)
DF3$sex <- factor(DF3$sex)

DF1$current_smoker <- factor(DF1$current_smoker)
DF2$current_smoker <- factor(DF2$current_smoker)
DF3$current_smoker <- factor(DF3$current_smoker)

#Haré conteos de las variables de interes en cada dataframe.

table(DF3$sex) #2081 = mujeres, 1798 = hombres.
table(DF2$sex) #1254 = mujeres, 711 = hombres.
table(DF1$sex) #827 = mujeres, 1087 = hombres.

table(DF3$current_smoker) # 1965 no fumadores, 1914 fumadores.

#Edades de los fumadores

min(DF3$age) #Edad mínima general es 32 años.
max(DF3$age) #Edad máxima general es 70 años.
mean(DF3$age) #Edad promedio general es 49.54318 años.

#Cigarrillos consumidos por dia.

min(DF3$cigs_per_day) #El mínimo de cigarros consumidos por día es 0.
max(DF3$cigs_per_day) #El máximo de cigarros consumidos por día es 70.
mean(DF3$cigs_per_day) #El promedio de cigarrilos consumidos por dias es de 9.163702.

#Colesterol de los fumadores.

min(DF3$chol) #El colesterol minimo que se puede observar es de 113 mg/dL. 
max(DF3$chol) #El colesterol maximo que se puede observar es de 696 mg/dL.
mean(DF3$chol) #El promedio de colesterol que se puede observar es de 236.6293 mg/dL.

#Ritmo cardiaco de los fumadores.

min(DF3$heart_rate) #El ritmo cardiaco minimo es de 44 latidos por minuto.
max(DF3$heart_rate) #El ritmo cardiaco maximo es de 143 latidos por minuto.
mean(DF3$heart_rate) #el promedio de ritmo cardiuaco es de 75.69915 latidos por minuto.

#Todos esos datos se pueden ver a detalle con la función summary.

summary(DF3)
summary(DF2)
summary(DF1) 

#Caracteristicas que se pueden visualizar del DF1

view(DF1)
nrow(DF1)
str(DF1)

#Extraje informacion de DF1 

DF1$cigs_per_day
DF1$sex

DF1$promedio <- (DF1$age + DF1$heart_rate)
view(DF1$promedio <- (DF1$age + DF1$heart_rate))

view(head(Smoker_G7,10))

is.na(Smoker_G7)
colSums(is.na.data.frame(DF1))

#Histograma de la edad de los fumadores 

hist(DF1$age, 
     breaks = 20,
     col = blues9,
     xlab = "edad",
     main = "Histograma de edad de los fumadores")

#histograma de edad de los no fumadores 

hist(DF2$age,
     breaks = 20,
     col = blues9,
     xlab = "edad",
     main = "Histograma de la edad de no fumadores")

#caracteristicas que se pueden visualizar del DF2

View(DF2)
nrow(DF2)
str(DF2)

#Extraje informacion del DF2

DF2$heart_rate
DF2$chol

DF2$promedio <- (DF2$chol + DF2$heart_rate)
view(DF2$promedio <- (DF2$chol + DF2$heart_rate))

#Este codigo lo hemos realizado entre todos, obviamente aun falta