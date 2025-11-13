# Cyclistic Project

## Descripción del proyecto
Este proyecto analiza los patrones de uso de las bicicletas compartidas de **Cyclistic** en Chicago durante 2019–2020.  
El objetivo es **entender el comportamiento de los usuarios**, comparando **suscritos (Subscribers)** y **casuales (Customers)**, y ofrecer **recomendaciones de marketing** para aumentar la conversión de usuarios ocasionales a miembros.

El proyecto incluye limpieza, agregación y visualización de datos para responder a las siguientes preguntas principales:

1. ¿Cómo difiere el uso de bicicletas entre suscritos y casuales?  
2. ¿Qué estaciones y horarios presentan mayor actividad?  
3. ¿Qué oportunidades de marketing existen para convertir casuales en miembros?

---

## Estructura del repositorio

Cyclistic_Project/
│
├── data/ # Datasets procesados y resúmenes (CSV)
│ ├── customers_day_summary.csv
│ ├── subscribers_day_summary.csv
│ ├── day_summary.csv
│ ├── top_end_stations.csv
│ └── top_start_stations.csv
│
├── scripts/ # Scripts de R usados para limpieza, análisis y visualización
│ └── analysis_scripts.R
│
├── outputs/ # Gráficos y tablas generadas
│ ├── histograms/
│ ├── boxplots/
│ └── summary_tables/
│
└── docs/ # Documentación y conclusiones
└── Conclusiones.html


> ⚠️ Nota: Los datasets originales completos no se incluyen por su tamaño. Todos los archivos procesados se generaron a partir de los datos originales.

---

## Insights clave

### Comparativa de uso: Suscritos vs. Casuales

| Aspecto                              | Suscritos (Subscribers)                                                                                         | Casuales (Usuarios ocasionales)                                                                                                                   |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Patrón de uso semanal**            | Más viajes entre martes y jueves; uso diario constante.                                                         | Menos viajes totales; fines de semana destacan. Uso más ocasional.                                                                                |
| **Duración promedio de viajes**      | 8–9.8 minutos. Trayectos cortos y habituales.                                                                  | 27–42 minutos. Trayectos largos, orientados a ocio o turismo.                                                                                      |
| **Mediana de duración**              | Similar a la media.                                                                                             | Mediana alta.                                                                                                                                    |
| **Estaciones de salida**             | Zonas céntricas: Canal St, Clinton St, Kingsbury St.                                                            | Zonas turísticas: HQ QR, Lake Shore Dr, Streeter Dr, Millennium Park, Shedd Aquarium.                                                            |
| **Estaciones de llegada**            | Zonas céntricas                                                                                                 | Zonas turísticas                                                                                                                                |
| **Horas punta**                       | 7–9 h / 16–18 h (commuting).                                                                                   | 12–15 h y fines de semana (ocio/turismo).                                                                                                        |
| **Patrón general**                   | Uso frecuente, trayectos cortos, commuting diario.                                                             | Uso ocasional, trayectos largos, ocio/turismo.                                                                                                   |
| **Outliers / viajes extremos**       | Algunos viajes muy largos afectan la media; revisar para limpieza de datos.                                     | Igual, algunos viajes extremos pueden ser errores o rutas turísticas largas.                                                                    |
| **Aplicación marketing / producto**  | Fidelización de suscritos, promociones de commuting, estaciones céntricas.                                      | Paquetes de ocio/turismo, experiencias de fin de semana, promoción de rutas turísticas.                                                          |
| **Oportunidad conversión**           | Mantener uso frecuente; reforzar beneficios del plan de suscripción.                                            | Incentivar suscripción mostrando ventajas de viajes ilimitados, descuentos o rutas planificadas, especialmente en estaciones top y horarios pico. |

---

### Insight para marketing: convertir casuales en miembros
- Dirigir promociones de membresía a usuarios casuales durante fines de semana o en zonas turísticas donde suelen moverse.  
- Ofertas específicas en sus horas y estaciones más usadas aumentan la probabilidad de conversión.  
- Paquetes especiales de ocio/turismo y programas de fidelización para retener usuarios una vez convertidos.  

---

## Cómo usar el proyecto
1. Clonar el repositorio:  
```bash
git clone https://github.com/almu81/Ciclystic_Project.git


> ⚠️ Nota: Los datasets originales completos no se incluyen por su tamaño. Todos los archivos procesados se generaron a partir de los datos originales.

---

## Insights clave

### Comparativa de uso: Suscritos vs. Casuales

| Aspecto                              | Suscritos (Subscribers)                                                                                         | Casuales (Usuarios ocasionales)                                                                                                                   |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Patrón de uso semanal**            | Más viajes entre martes y jueves; uso diario constante.                                                         | Menos viajes totales; fines de semana destacan. Uso más ocasional.                                                                                |
| **Duración promedio de viajes**      | 8–9.8 minutos. Trayectos cortos y habituales.                                                                  | 27–42 minutos. Trayectos largos, orientados a ocio o turismo.                                                                                      |
| **Mediana de duración**              | Similar a la media.                                                                                             | Mediana alta.                                                                                                                                    |
| **Estaciones de salida**             | Zonas céntricas: Canal St, Clinton St, Kingsbury St.                                                            | Zonas turísticas: HQ QR, Lake Shore Dr, Streeter Dr, Millennium Park, Shedd Aquarium.                                                            |
| **Estaciones de llegada**            | Zonas céntricas                                                                                                 | Zonas turísticas                                                                                                                                |
| **Horas punta**                       | 7–9 h / 16–18 h (commuting).                                                                                   | 12–15 h y fines de semana (ocio/turismo).                                                                                                        |
| **Patrón general**                   | Uso frecuente, trayectos cortos, commuting diario.                                                             | Uso ocasional, trayectos largos, ocio/turismo.                                                                                                   |
| **Outliers / viajes extremos**       | Algunos viajes muy largos afectan la media; revisar para limpieza de datos.                                     | Igual, algunos viajes extremos pueden ser errores o rutas turísticas largas.                                                                    |
| **Aplicación marketing / producto**  | Fidelización de suscritos, promociones de commuting, estaciones céntricas.                                      | Paquetes de ocio/turismo, experiencias de fin de semana, promoción de rutas turísticas.                                                          |
| **Oportunidad conversión**           | Mantener uso frecuente; reforzar beneficios del plan de suscripción.                                            | Incentivar suscripción mostrando ventajas de viajes ilimitados, descuentos o rutas planificadas, especialmente en estaciones top y horarios pico. |

---

### Insight para marketing: convertir casuales en miembros
- Dirigir promociones de membresía a usuarios casuales durante fines de semana o en zonas turísticas donde suelen moverse.  
- Ofertas específicas en sus horas y estaciones más usadas aumentan la probabilidad de conversión.  
- Paquetes especiales de ocio/turismo y programas de fidelización para retener usuarios una vez convertidos.  

Abrir los scripts en RStudio para reproducir análisis y gráficos.

Explorar los archivos en outputs/ para ver tablas y visualizaciones generadas.


### Fuente de datos

Los datasets originales de Cyclistic fueron descargados de la plataforma de datos abiertos de la ciudad de Chicago y procesados para análisis en este proyecto.

