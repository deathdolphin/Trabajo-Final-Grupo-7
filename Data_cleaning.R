pacman::p_load(tidyverse, pacman, DescTools)

#Identificar Outliers en cigs_per_day 

DF1 <- na.omit(Smoker_G7) %>% 
  filter(current_smoker == "yes")

summary(DF1)

20 + (1.5 * IQR(DF1$cigs_per_day)) #Límite superior
10 - (1.5 * IQR(DF1$cigs_per_day)) #Límite Inferior

# Winsorize cigs_per_day

x <- DF1$cigs_per_day

cigs_cleaned <- Winsorize(x, minval = NULL, maxval = NULL,
                          probs = c(0,0.92), na.rm = TRUE, 
                          type = 1)

# Obtener nueva media aritmética

summary(cigs_cleaned) #17.93

# Limpiar valores NA

DF1$cigs_per_day[is.na(DF1$cigs_per_day)] <- 18

x <- DF1$cigs_per_day
cigs_cleaned <- Winsorize(x, minval = NULL, maxval = NULL,
                          probs = c(0,0.92), na.rm = TRUE, 
                          type = 1)
#Creación df_cleaned

df1_cleaned <- DF1 %>% 
  mutate(cigs_per_day = cigs_cleaned)
  




