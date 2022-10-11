#GRados OESTE a este 360-grados

#Ejemplo clase 11/10/22
#Objetivo: Leer  datos en archivos xls
#Armar una tabla con los meses en columnas y los anios en filas
#Calcular el promedio mensual del periodo, el promedio anual y promedio de
#toda la serie
###########################################################################

rm(list=ls())
graphics.off()   #cierro los graficos 

DATA<- "~/LABO/Practica/datos/"       #CAMBIAR RUTA
salidas<-"~/LABO/Practica/Salidas/"      #CAMBIAR RUTA
n_archivo<- "datos_ocba_2000_2006.xls"

archivo <- paste(DATA,n_archivo,sep="") #armo el acceso al archivo con la ruta y el nombre

#Cargo la libreria que necesito utilizar
require(gdata)
#installXLSXsupport(perl = 'C:\\strawberry\\perl\\bin\\perl.exe') 

#Exploro la info del archivo
n_sheets <- sheetCount(archivo) #nro de hojas en el archivo
names<-sheetNames(archivo)      #nombres de las hojas  

#Cargo los datos en dos variables distintas

datosT<-read.xls(archivo,sheet=names[1],header=FALSE) #Uso el vector de nombres para abrir
datosPP<-read.xls(archivo,sheet="pp",header=FALSE)     #Uso el nombre de la hoja
datosT<-read.xls(archivo,sheet="temp",header=FALSE)

#Tambien puedo usar la posicion de la hoja => sheet = 2

#Asigno los datos de PP y Temp a nuevas variables
temp <-datosT[,3]
temp
precip <- datosPP[,3]
precip
#Quiero generar una tabla con los meses en columnas y los anios en filas
a<-seq(2000,2006)
a
m<-as.vector(datosT[1:12,1])
m

#Reordenamiento de la tabla
dim(temp)<-c(12,length(temp)/12)
dim(temp) #12 meses x 7 datos ((años, mirar variable "a")(meses como nombres de columnas)
temp <- t(temp)
temp
dim(precip)<-c(12,length(precip)/12)
dim(precip) #Lo mismo pero con 7 años x 12 meses (otra forma de trabajar y buena) (meses como nomrbes de filas)
precip <- t(precip)
precip

#Borro del espacio de trabajo, las variables que ya no voy a utilizar
rm(datosPP,datosT)

#NOmbro las columnas y filas
colnames(temp)<-m
rownames(temp)<-a

temp

#Podemos hacer lo mismo con precip
colnames(precip)<-a
rownames(precip)<-m
precip


#Calculo la media mensual (quiero un promedio por columnas) 
dim(temp)
Tmed_2000_06 <-apply(temp,c(2), mean) #COMPLETAR
Tmed_2000_06 #Perfecto
dim(precip)
PPmed_2000_06 <-apply(precip,c(1), mean) #COMPLETAR
PPmed_2000_06
  
  #Ahora la media por anios
  anual_T <-apply(temp,c(1), mean)                           #COMPLETAR
  anual_T
  anual_PP <-apply(precip,c(2), mean)                          #COMPLETAR
  anual_PP
  
  #Promedio de todos los datos (todos los meses y anios)
  #Me aprece que aca calcule el promedi ode todos los eneros del 2000, todos lso eneros del 2001....
  #prom_T <-apply(temp,c(1,2),mean)                           #COMPLETAR
  #prom_T
  #prom_PP <-apply(precip, c(2,1), mean)                          #COMPLETAR
  #prom_PP
  
  #Tenia que hacer esto
  prom_T1<-mean(temp)                           #COMPLETAR
  prom_T1
  prom_PP1 <-mean(precip)                          #COMPLETAR
  prom_PP1
  
  # Una vez que ordene la serie como quiero, genero un data frame para T y otro para PP
  salidaT <-data.frame(temp,row.names=a)
colnames(salidaT)<-m
salidaT<-cbind(salidaT,anual_T)
fila_promT <- c(Tmed_2000_06,prom_T)  #Fila con los promedio de cada mes y promedio total
salidaT<-rbind(salidaT,Prom2000_06=fila_promT)
salidaT
View(salidaT)

#Si quiero guardar en un archivo, lo guardo en un csv o txt
write.csv(salidaT,paste(salidas,"tablaT.csv",sep=""),quote=FALSE)
write.table(salidaT,paste(salidas,"tablaT2.txt",sep=""),quote=FALSE,sep="\t") #Sep = "/t" genra una tabulacion entre cada dato

salidaPP <-data.frame(precip,row.names=a)
colnames(salidaPP)<-m
salidaPP<-cbind(salidaPP,anual_PP)
fila_promPP<-c(PPmed_2000_06,prom_PP)  #Fila con los promedio de cada mes y promedio total
salidaPP<-rbind(salidaPP,Prom2000_06=fila_promPP)



