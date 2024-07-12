# Grafico, Edades de los no fumadores vs edades de los fumadores
#Objetivo: Observar discrepancia entre las edades de los fumadores y no fumadores
df1_cleaned %>%
  ggplot(aes(x = cigs_per_day)) +
  geom_histogram(binwidth = 34/12)

df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = age, fill = sex)) + 
  geom_boxplot()

df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = age)) + 

    geom_boxplot()
df2_cleaned %>%
  ggplot(aes(x = current_smoker, fill = sex)) +
  geom_bar(position = "dodge")

df2_cleaned %>%
  ggplot(aes(x = current_smoker, fill = sex)) +
  geom_bar(position = "fill")
#
df2_cleaned %>%
  ggplot(aes(x = current_smoker, y = sex)) + 
  geom_count()

df1_cleaned %>%
  ggplot(aes(x = sex, y = cigs_per_day, fill = "green")) +
  #geom_violin( width = 1.07) +
  geom_boxplot(fill = df1_cleaned$sex)
  

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

#Diseño de edad vs cigarros fumados al día
    
    df3_bracket <- df1_cleaned %>%
      mutate(edades = cut(age, breaks = c(31, 33, 35, 37, 39, 41, 43, 45, 47 ,49,
                                          51,53,55,57,59,61,63,65,67,69)))
    
    df3_bracket %>%
      group_by(edades) %>%
      summarise(mean_cigs_per_day = mean(cigs_per_day)) %>%
      ggplot(aes(x = edades, y = mean_cigs_per_day)) +
      geom_point(size = 3,
                 colour = "turquoise") +
      geom_segment(aes(x = edades,
                       y = mean(df3_bracket$cigs_per_day),
                       xend = edades,
                       yend = mean_cigs_per_day),
                   colour = "orange") +
      geom_hline(yintercept = mean(df3_bracket$cigs_per_day),
                 colour = "gray", size = 1) +
      theme(axis.text.x.bottom = element_text(angle = 20), text) +
      labs(title = 
             "Promedio de cigarrillos consumidos al día por rango de edades",
           x ="", y = "cigarrillos consumidos al día")
    
  # Diseño de rangos de edades
    
    df4_bracket <- df1_cleaned %>%
      mutate(edades = cut(age, breaks = c(30, 40, 50, 60, 70)))
    df4_bracket %>%
      ggplot(aes( x = edades)) +
      geom_bar(fill = "brown")
