#  Resumen de duración y número de viajes por día
customers_day_summary <- customers_df %>%
  group_by(day_of_week) %>%
  summarise(
    total_rides = n(),
    mean_duration = mean(ride_length),
    median_duration = median(ride_length)
  )

customers_day_summary

ggplot(customers_day_summary, aes(x = day_of_week, y = total_rides)) +
  geom_col(fill = "skyblue") +
  labs(title = "Viajes de usuarios casuales por día de la semana",
       x = "Día de la semana",
       y = "Número de viajes") +
  theme_minimal()

ggplot(customers_day_summary, aes(x = day_of_week, y = mean_duration)) +
  geom_col(fill = "salmon") +
  labs(title = "Duración promedio de viajes de usuarios casuales por día",
       x = "Día de la semana",
       y = "Duración promedio (minutos)") +
  theme_minimal()

# Top 5 estaciones de salida
top_start_stations_casual <- customers_df %>%
  group_by(start_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)

top_start_stations

#  Top 5 estaciones de llegada
top_end_stations_casual <- customers_df %>%
  group_by(end_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)

top_end_stations

top_end_stations <- customers_df %>%
  group_by(end_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)  

ggplot(top_end_stations, aes(x = reorder(end_station_name, total_rides), y = total_rides)) +
  geom_col(fill = "orange") +
  coord_flip() +
  labs(title = "Top 5 estaciones de llegada - usuarios casuales",
       x = "Estación",
       y = "Número de viajes") +
  theme_minimal()

top_start_stations <- customers_df %>%
  group_by(start_station_name) %>%
  summarise(total_rides = n()) %>%
  arrange(desc(total_rides)) %>%
  slice_head(n = 5)

ggplot(top_start_stations, aes(x = reorder(start_station_name, total_rides), y = total_rides)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Top 5 estaciones de salida - usuarios casuales",
       x = "Estación",
       y = "Número de viajes") +
  theme_minimal()


