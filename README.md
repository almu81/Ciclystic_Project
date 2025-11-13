# Cyclistic Project

Análisis de datos del sistema de bicicletas compartidas Cyclistic (Chicago). Este proyecto compara el comportamiento de los **usuarios suscritos** y los **usuarios ocasionales (casuales)**, con insights para marketing y oportunidades de conversión de casuales a miembros.

## Fuente de los datos

Los datos originales se descargaron del [repositorio oficial de Divvy](https://divvy-tripdata.s3.amazonaws.com/index.html).  
Se utilizaron los datasets correspondientes al **primer trimestre de 2019 y 2020**.

## Estructura del proyecto

El proyecto está organizado en las siguientes carpetas:

- `data/` — Contiene los datasets procesados y resumidos para análisis.  
- `scripts/` — Contiene los scripts de R usados para limpiar, unir y analizar los datos:  
  - `recopilar_datos.R` — Descarga y unifica los datasets originales.  
  - `casual&suscritos.R` — Procesa y compara casuales vs suscritos.  
  - `casual_analizar_datos.R` — Análisis específico para usuarios casuales.  
  - `suscritos_analizar_datos.R` — Análisis específico para suscritos.  
- `outputs/` — Gráficos y tablas generadas a partir de los datos.  
- `docs/` — Conclusiones, insights y reportes en formato texto/Markdown.

## Conclusiones y hallazgos clave

| Aspecto                              | Suscritos (Subscribers)                                                                                         | Casuales (Usuarios ocasionales)                                                                                                                   |
| ------------------------------------ | --------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Patrón de uso semanal**            | Más viajes entre martes y jueves; algo menos los fines de semana. Uso diario constante.                         | Menos viajes totales; fines de semana destacan. Uso más ocasional.                                                                                |
| **Duración promedio de viajes**      | Entre 8 y 9.8 minutos. Trayectos cortos y habituales.                                                           | Entre 27 y 42 minutos. Trayectos largos, claramente por ocio o turismo.                                                                           |
| **Mediana de duración**              | Similar a la media, mostrando consistencia en viajes cortos.                                                    | Mediana alta, mostrando que la mayoría de viajes son largos.                                                                                      |
| **Estaciones de salida**             | Canal St & Adams St, Clinton St & Madison St, Clinton St & Washington Blvd. Zonas céntricas de tránsito diario. | HQ QR, Lake Shore Dr & Monroe St, Streeter Dr & Grand Ave. Zonas turísticas y de ocio.                                                            |
| **Estaciones de llegada**            | Canal St & Adams St, Clinton St & Madison St, Clinton St & Washington Blvd.                                     | HQ QR, Streeter Dr & Grand Ave, Lake Shore Dr & Monroe St.                                                                                        |
| **Horas punta**                      | Entre 7-9 h y 16-18 h (trayectos commuting).                                                                    | Entre 12-15 h y fines de semana (ocio/turismo).                                                                                                   |
| **Patrón general de comportamiento** | Uso frecuente, viajes cortos, orientado a commuting o rutina diaria.                                            | Uso ocasional, viajes largos, orientado a ocio o turismo.                                                                                         |
| **Outliers / viajes extremos**       | Algunos viajes muy largos afectan la media; revisar para limpieza de datos.                                     | Igual, algunos viajes extremos pueden ser errores o rutas turísticas largas.                                                                     |
| **Aplicación marketing / producto**  | Fidelización de suscritos, promociones de commuting, estaciones céntricas.                                      | Paquetes de ocio/turismo, experiencias de fin de semana, promoción de rutas turísticas.                                                           |
| **Oportunidad conversión**           | Mantener uso frecuente; reforzar beneficios del plan de suscripción.                                            | Incentivar suscripción mostrando ventajas de viajes ilimitados, descuentos o rutas planificadas, especialmente en estaciones top y horarios pico. |

✅ **Insight clave para la tercera pregunta (convertir casuales en miembros)**:  
Marketing puede dirigir promociones de membresía a los casuales destacando beneficios de suscripción durante fines de semana o en zonas turísticas donde suelen moverse. Ofertas específicas en sus horas y estaciones más usadas aumentan la probabilidad de conversión.

## Infografía de comportamiento y oportunidades de marketing

1️⃣ **Patrones de uso por tipo de usuario**

| Tipo de usuario | Horas pico        | Días destacados       | Duración promedio |
| --------------- | ---------------- | ------------------- | ---------------- |
| Suscritos       | 7-9 h / 16-18 h  | Martes a jueves     | 8–9.8 min        |
| Casuales        | 12-15 h          | Fines de semana     | 27–42 min        |

2️⃣ **Estaciones más usadas**  
- Suscritos: Canal St, Clinton St, Kingsbury St → zonas céntricas → commuting diario  
- Casuales: HQ QR, Lake Shore Dr, Streeter Dr, Millennium Park, Shedd Aquarium → zonas turísticas → ocio/turismo

3️⃣ **Patrones generales**  
- Suscritos: Uso frecuente, trayectos cortos, orientado a rutina laboral.  
- Casuales: Uso ocasional, trayectos largos, orientado a ocio y turismo.

4️⃣ **Oportunidades de marketing para convertir casuales en miembros**  
- Focalizar promociones de membresía en horas y días de mayor uso casual (12-15 h, fines de semana).  
- Incentivos en estaciones turísticas clave para mostrar beneficios de suscripción.  
- Paquetes especiales de ocio/turismo para que vean valor en convertirse en suscritos.  
- Programas de fidelización para retener usuarios una vez convertidos.

---

**Nota**: Todos los scripts están en R y se pueden ejecutar para reproducir el análisis y generar los outputs.  
