# cargar libreria tidyverse
# install.packages("tidyverse")
library(tidyverse)



# crear un objeto "fecha" con la fecha del primero de julio de 2023
fecha <- as.Date("2023/07/01")


# leer el csv desde la siguiente url y asignarlo a un objeto "df" tipo tibble
url <-  "http://datos.yvera.gob.ar/dataset/c0e7bc3d-553c-405c-8b32-79282b28ffd5/resource/03b4176f-a065-450a-b411-101d2a884720/download/vuelos_asientos_pasajeros.csv"
df2 <- read.csv(file = url)
df <- read_csv(file = url)


head(df)
glimpse(df)
glimpse(df2)
class(df)
class(df2)


# calcular la media y la mediana por año y tipo de vuelo para cada variable número
# asignarlo a un objeto "tabla_resumen"

mean(df$pasajeros)

resumen_pasajeros <- df %>% 
  select(indice_tiempo, clasificacion_vuelo, pasajeros) %>% 
  mutate(anio = year(indice_tiempo)) %>% 
  group_by(anio,clasificacion_vuelo) %>% 
  summarise(media_pasajeros = mean(pasajeros),
            mediana_pasajeros = median(pasajeros))
  

# con tabla_resumen calcular la diferencia entre la media y la mediana de vuelos por año y tipo de vuelo
# seleccionar solo las variable de año y diferencia
resumen_pasajeros %>% 
  mutate(diferencia = media_pasajeros - mediana_pasajeros)
  
