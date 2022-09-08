WORKDIR <- "/home/clinux01/Escritorio/LABO"  #POdemos cargar un data frame, setemao el directoprio de trabajo

setwd (WORKDIR)        

mitabla <- read.table("datos.RData")
View(datos)


mes=datos[,2] #Seleccionamos la columna mes (osea la 2)
mes
 
#SI quisieramos la fecha seria
fecha = datos[,1:3] #Le pedimos que nos de las columnas 1 a 3
fecha

#Queremos identeidificar los datos de verano

indices = which(mes==12 | mes== 1 | mes == 2); #(EStoy agarrando a los mesess de ENE FEB Y DICIEMBRE)
datos_DEF = datos[indices,];
datos_DEF #ES la misma matriz pero con los datos que queremos analizar
dim(datos_DEF)

#Otra forma seria
indices_log = (mes== 12| mes == 1 | mes == 2);
datos_DEF2 = datos[indices_log,];
datos_DEF2
#o tambien

datos_DEF3 = datos[mes==12 | mes==1 |mes==2,]
datos_DEF3

# NOs piden la Tmax media y la Tmin media
#Separamos en columnas de Tmax y Tmin
#Reemplazo los datos faltantes codificados con 999.9 por NA

datos[datos==999.9]=NA
datos
#Predifinimos
tmax_media = NA #ESto es para no darle dim a la variable y por convencion, hacemos esto. Ademas de que estamos indicandoque esta variable esta y existe
tmin_media = NA
