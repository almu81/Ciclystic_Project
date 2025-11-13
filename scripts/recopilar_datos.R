install.packages("tidyverse")
install.packages("lubridate")
install.packages("janitor")
install.packages("ggplot2")

library(tidyverse)
library(lubridate)
library(janitor)
library(ggplot2)

trips_2019_Q1 <- read_csv("2019_Q1.csv")
trips_2020_Q1 <- read_csv("2020_Q1.csv")

colnames(trips_2019_Q1)
colnames(trips_2020_Q1)

trips_2019_Q1 <- trips_2019_Q1 %>%
  rename(
    ride_id = trip_id,
    started_at = start_time,
    ended_at = end_time,
    start_station_name = from_station_name,
    start_station_id = from_station_id,
    end_station_name = to_station_name,
    end_station_id = to_station_id,
    member_casual = usertype
  )

common_cols <- intersect(names(trips_2019_Q1), names(trips_2020_Q1))
trips_2019_Q1_common <- trips_2019_Q1[, common_cols]
trips_2020_Q1_common <- trips_2020_Q1[, common_cols]

# Convertir ride_id a character en ambos datasets
trips_2019_Q1_common <- trips_2019_Q1_common %>%
  mutate(ride_id = as.character(ride_id))

trips_2020_Q1_common <- trips_2020_Q1_common %>%
  mutate(ride_id = as.character(ride_id))

all_trips <- bind_rows(trips_2019_Q1_common, trips_2020_Q1_common)

#  Limpiar memoria eliminando variables intermedias
rm(trips_2019_Q1_common, trips_2020_Q1_common)

gc()

#  Dataset solo de miembros (subscribers)
subscribers_df <- all_trips %>%
  filter(member_casual == "member")

#  Dataset solo de usuarios casuales (customers)
customers_df <- all_trips %>%
  filter(member_casual == "casual")

#  Comprobar filas de cada dataset
nrow(subscribers_df)
nrow(customers_df)

#  Primeras filas para asegurarnos que está todo correcto
head(subscribers_df)
head(customers_df)

#  Para subscribers
subscribers_df <- subscribers_df %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),  # duración en minutos
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE)  # día de la semana como factor
  )

#  Para customers
customers_df <- customers_df %>%
  mutate(
    ride_length = as.numeric(difftime(ended_at, started_at, units = "mins")),  # duración en minutos
    day_of_week = wday(started_at, label = TRUE, abbr = FALSE)  # día de la semana como factor
  )

#  Comprobamos primeras filas
head(subscribers_df)
head(customers_df)

#  Estadísticas rápidas
summary(subscribers_df$ride_length)
summary(customers_df$ride_length)


#  Limpiar subscribers
subscribers_df <- subscribers_df %>%
  filter(ride_length > 0, ride_length <= 1440)

# 🔹 Limpiar customers
customers_df <- customers_df %>%
  filter(ride_length > 0, ride_length <= 1440)

# 🔹 Comprobamos resumen tras limpieza
summary(subscribers_df$ride_length)
summary(customers_df$ride_length)





