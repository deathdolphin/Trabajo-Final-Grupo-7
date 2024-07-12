pacman::p_load(tidyverse, pacman, DescTools, moments, forcats)

#Identificar Outliers en cigs_per_day 

DF1 <- na.omit(Smoker_G7) %>% 
  filter(current_smoker == "yes")
  DF1$sex <- factor(DF1$sex)
  DF1$current_smoker <- factor(DF1$current_smoker)

summary(DF1)

(20 + (1.5 * IQR(DF1$cigs_per_day))) #Límite superior
(10 - (1.5 * IQR(DF1$cigs_per_day))) #Límite Inferior

# Winsorize cigs_per_day

x <- DF1$cigs_per_day

cigs_cleaned <- Winsorize(x, minval = NULL, maxval = NULL,
                          probs = c(0,0.92), na.rm = TRUE, 
                          type = 1)

# Obtener nueva media aritmética

summary(cigs_cleaned) #17.93

# Limpiar valores NA

Smoker_G7$cigs_per_day[is.na(Smoker_G7$cigs_per_day)] <- 18

DF1 <- Smoker_G7 %>%
  filter(current_smoker == "yes")

x <- DF1$cigs_per_day

cigs_cleaned <- Winsorize(x, minval = NULL, maxval = NULL,
                          probs = c(0,0.92), na.rm = TRUE, 
                          type = 1)
#Creación df_cleaned

df1_cleaned <- DF1 %>% 
  mutate(cigs_per_day = cigs_cleaned) %>% 
  separate_wider_delim(
    blood_pressure,
    delim = "/",
    names = c("systolic_pressure", "dystolic_pressure"))
  
df1_cleaned$systolic_pressure <- as.numeric(df1_cleaned$systolic_pressure)
df1_cleaned$dystolic_pressure <- as.numeric(df1_cleaned$dystolic_pressure)

#Creación df2_cleaned
y <- Smoker_G7$cigs_per_day
cigs_cleaned2 <-  Winsorize(y, minval = NULL, maxval = NULL,
                            probs = c(0,0.96), na.rm = TRUE, 
                            type = 1)
df2_cleaned <- Smoker_G7 %>%
  mutate(cigs_per_day = cigs_cleaned2) %>%
  separate_wider_delim(
    blood_pressure, delim = "/",
                       names= c("systolic_pressure", "dystolic_pressure"))
df2_cleaned$systolic_pressure <- as.numeric(df2_cleaned$systolic_pressure)
df2_cleaned$dystolic_pressure <- as.numeric(df2_cleaned$dystolic_pressure)

df1_cleaned$sex <- factor(df1_cleaned$sex)
df1_cleaned$current_smoker <- factor(df1_cleaned$current_smoker) 

df2_cleaned$sex <- factor(df2_cleaned$sex)
df2_cleaned$current_smoker <- factor(df2_cleaned$current_smoker)  
  




