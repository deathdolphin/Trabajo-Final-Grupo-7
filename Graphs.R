# Grafico, Edades de los no fumadores vs edades de los fumadores
#Objetivo: Observar discrepancia entre las edades de los fumadores y no fumadores

df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = age, fill = sex)) + 
  geom_boxplot()
df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = age)) + 
  geom_boxplot()
df2_cleaned %>%
  ggplot(aes(x = current_smoker, fill = sex)) +
  geom_bar(position = "dodge")
#
df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = sex)) + 
  geom_count()

df1_cleaned %>%
  ggplot(aes(x = age, y = cigs_per_day)) +
  geom_point()

df1_cleaned %>%
  ggplot(aes(x = age, y = cigs_per_day, shape = sex)) +
  geom_smooth()

df1_cleaned %>%
  ggplot(aes(x = age, y = cigs_per_day, color = sex)) +
  geom_point() +
  geom_smooth()

df2_cleaned %>%
  ggplot(aes(x = sex , y = age, fill = current_smoker)) + 
  geom_tile()

    cov(df1_cleaned$age, cigs_cleaned)
    cor(df1_cleaned$age, cigs_cleaned)

?cov
