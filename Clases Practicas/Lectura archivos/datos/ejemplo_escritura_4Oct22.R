# Clase 12: Lectura y escritura de archivos .txt
# Ejemplos escritura

rm(list=ls())

# Seteo el espacio de trabajo [MODIFICAR CON SU RUTA]
setwd("~/Escritorio/Labo/Labo-de-datos-R-main/Clases Practicas/Clase 04-10")

# Una vez seteado el setwd 
library(here)

# VAMOS A USAR LA FUNCION WRITE.TABLE

####################################################
#ARCHIVO 5
####################################################
# Tomo como datos el archivo ejemplo 5
archivo5 <- here("datos", "ejemplo_lectura_5.txt")
datos<- read.table(archivo5,header=TRUE, na.strings="*")

#primero seteo el directorio de salidas y el nombre del archivo
# Recuerden que la carpeta salidas/ debe existir previamente en su directorio
archivo_salida <- here("salidas", "ejemplo_escritura_datos.txt")

#luego uso la funcion write.table especificando primero la
# variable datos_salida
# y luego el nombre de archivo con su ruta correspondiente

write.table(datos,archivo_salida)

# Si no especifico nada, va usar las comillas para mostrar strings,  
# al igual que el output por pantalla

# # si quiero especificar que los caracteres sean sin comillas uso 
# quote=FALSE
write.table(datos,archivo_salida,quote=FALSE)
# Ojo! sobreescribe el archivo generado anteriormente

# Notar que muestra una columna con el numero de fila
# y una fila con los nombres de las columnas (encabezado)
# Quiero conservar encabezado pero no incluir el numero de fila
# Uso row.names y col.names. Por default, son TRUE
write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE)

# Si no quisiera que me sobreescriba el archivo de salida, 
# sino agregar información, entonces usamos APPEND. Por default es FALSE

write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE,append = TRUE)

# Quiero que utilice coma para separar los decimales 
# y separar con tabs 
write.table(datos,archivo_salida,quote=FALSE,row.names=FALSE,
            col.names=TRUE,sep="\t",dec=",")

