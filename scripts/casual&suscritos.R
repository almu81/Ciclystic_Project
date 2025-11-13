all_trips <- all_trips %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),
    day_of_week = lubridate::wday(started_at, label = TRUE, abbr = FALSE)
  )

# Ahora sí puedes crear el resumen combinado
day_summary <- all_trips %>%
  group_by(member_casual, day_of_week) %>%
  summarise(
    total_rides = n(),
    mean_duration = mean(ride_length),
    median_duration = median(ride_length),
    .groups = "drop"
  )
day_summary <- day_summary %>%
  filter(member_casual %in% c("member", "casual")) %>%
  mutate(
    member_casual = recode(member_casual,
                           "member" = "Suscritos",
                           "casual" = "Casuales"),
    day_of_week = factor(day_of_week, 
                         levels = c("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"))
  )

# Gráfico comparativo de número de viajes por día
ggplot(day_summary, aes(x = day_of_week, y = total_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("Suscritos" = "skyblue", "Casuales" = "orange")) +
  labs(
    title = "Comparativa de viajes por día de la semana",
    x = "Día de la semana",
    y = "Número de viajes",
    fill = "Tipo de usuario"
  ) +
  theme_minimal()


#Gráfico comparativo de duración media por día
ggplot(day_summary, aes(x = day_of_week, y = mean_duration, fill = member_casual)) +
  geom_col(position = "dodge") +
  scale_fill_manual(values = c("Suscritos" = "skyblue", "Casuales" = "orange")) +
  labs(
    title = "Comparativa de duración media de viajes por día",
    x = "Día de la semana",
    y = "Duración media (minutos)",
    fill = "Tipo de usuario"
  ) +
  theme_minimal()

# Top 5 estaciones de salida por grupo
top_start_stations <- all_trips %>%
  group_by(member_casual, start_station_name) %>%
  summarise(total_rides = n(), .groups = "drop") %>%
  group_by(member_casual) %>%
  slice_max(total_rides, n = 5, with_ties = FALSE) %>%  # evita duplicados
  ungroup() %>%
  mutate(member_casual = factor(member_casual, levels = c("member", "casual")))
# Gráfico de salida
ggplot(top_start_stations, aes(x = reorder(start_station_name, total_rides), 
                               y = total_rides, fill = member_casual)) +
  geom_col(position = "dodge") +
  coord_flip() +
  labs(title = "Top 5 estaciones de salida - Members vs Casuals",
       x = "Estación", y = "Número de viajes") +
  scale_fill_manual(values = c("member" = "steelblue", "casual" = "orange")) +
  theme_minimal()

# Crear columna hour_of_day
subscribers_df <- subscribers_df %>%
  mutate(hour_of_day = lubridate::hour(started_at))

customers_df <- customers_df %>%
  mutate(hour_of_day = lubridate::hour(started_at))

# Resumen por hora
subscribers_hour_summary <- subscribers_df %>%
  group_by(hour_of_day) %>%
  summarise(total_rides = n(), .groups = "drop")

customers_hour_summary <- customers_df %>%
  group_by(hour_of_day) %>%
  summarise(total_rides = n(), .groups = "drop")
library(ggplot2)

# Suscritos
ggplot(subscribers_hour_summary, aes(x = hour_of_day, y = total_rides)) +
  geom_col(fill = "skyblue") +
  labs(title = "Viajes por hora - Suscritos",
       x = "Hora del día",
       y = "Número de viajes") +
  theme_minimal()

# Casuals
ggplot(customers_hour_summary, aes(x = hour_of_day, y = total_rides)) +
  geom_col(fill = "orange") +
  labs(title = "Viajes por hora - Casuals",
       x = "Hora del día",
       y = "Número de viajes") +
  theme_minimal()

# Crear resumen de viajes por hora y tipo de usuario
hour_summary <- all_trips %>%
  mutate(hour_of_day = lubridate::hour(started_at)) %>%
  group_by(member_casual, hour_of_day) %>%
  summarise(total_rides = n(), .groups = "drop")

# Mostrar dataset
hour_summary

all_trips <- all_trips %>%
  mutate(member_casual = case_when(
    member_casual %in% c("Casuales", "Customer") ~ "Customer",
    member_casual %in% c("Suscritos", "Subscriber") ~ "Subscriber"
  ))



# 🔹 Estadísticas resumen por grupo
duration_summary <- all_trips %>%
  group_by(member_casual) %>%
  summarise(
    min_duration = min(ride_length, na.rm = TRUE),
    q1_duration = quantile(ride_length, 0.25, na.rm = TRUE),
    median_duration = median(ride_length, na.rm = TRUE),
    mean_duration = mean(ride_length, na.rm = TRUE),
    q3_duration = quantile(ride_length, 0.75, na.rm = TRUE),
    max_duration = max(ride_length, na.rm = TRUE),
    .groups = "drop"
  )

duration_summary


library(ggplot2)
library(dplyr)
library(lubridate)

# Crear dataset resumido por día, hora y estación de salida
hour_station_summary <- all_trips %>%
  mutate(
    hour_of_day = hour(started_at)
  ) %>%
  group_by(member_casual, hour_of_day, start_station_name) %>%
  summarise(total_rides = n(), .groups = "drop")

# Seleccionar top 3 estaciones por grupo
top_stations <- hour_station_summary %>%
  group_by(member_casual, start_station_name) %>%
  summarise(total_rides_station = sum(total_rides), .groups = "drop") %>%
  group_by(member_casual) %>%
  slice_max(total_rides_station, n = 3) %>%
  ungroup()

# Filtrar solo las top 3 estaciones
hour_station_top <- hour_station_summary %>%
  filter(start_station_name %in% top_stations$start_station_name)

# Gráfico
ggplot(hour_station_top, aes(x = hour_of_day, y = total_rides, color = start_station_name)) +
  geom_line(size = 1.2) +
  facet_wrap(~member_casual) +
  labs(
    title = "Uso por hora y estaciones top",
    x = "Hora del día",
    y = "Número de viajes",
    color = "Estación"
  ) +
  theme_minimal() +
  scale_color_brewer(palette = "Set1") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
















  
