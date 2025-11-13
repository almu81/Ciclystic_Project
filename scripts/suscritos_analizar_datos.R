# Resumen de duración y número de viajes por día - subscribers
subscribers_day_summary <- subscribers_df %>%
  group_by(day_of_week) %>%
  summarise(
    total_rides = n(),
    mean_duration = mean(ride_length),
    median_duration = median(ride_length)
  )

# Gráfico de viajes por día
ggplot(subscribers_day_summary, aes(x = day_of_week, y = total_rides)) +
  geom_col(fill = "skyblue") +
  labs(title = "Viajes de usuarios miembros por día de la semana",
       x = "Día de la semana",
       y = "Número de viajes") +
  theme_minimal()

# Gráfico de duración promedio por día
ggplot(subscribers_day_summary, aes(x = day_of_week, y = mean_duration)) +
  geom_col(fill = "salmon") +
  labs(title = "Duración promedio de viajes de usuarios miembros por día",
       x = "Día de la semana",
       y = "Duración promedio (minutos)") +
  theme_minimal()

# Top 5 estaciones de salida
top_start_stations_subs <- subscribers_df %>%
  group_by(start_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)

# Top 5 estaciones de llegada
top_end_stations_subs <- subscribers_df %>%
  group_by(end_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)

# Gráficos de estaciones
ggplot(top_start_stations_subs, aes(x = reorder(start_station_name, total_rides), y = total_rides)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 5 estaciones de salida - usuarios miembros",
       x = "Estación",
       y = "Número de viajes") +
  theme_minimal()

ggplot(top_end_stations_subs, aes(x = reorder(end_station_name, total_rides), y = total_rides)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(title = "Top 5 estaciones de llegada - usuarios miembros",
       x = "Estación",
       y = "Número de viajes") +
  theme_minimal()
