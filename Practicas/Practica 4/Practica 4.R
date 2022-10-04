#Temas: Lectura y escritura de datos en R
##Ejercicio 1
#El archivo de datos 87576.dat es un archivo ascii. Abrir el archivo 87576.dat en modo solo
#lectura.
#a) Verificar que la apertura del archivo fue exitosa (impedir que el c ??odigo se interrumpa
#                                                      si el archivo no se encuentra, en este caso el script debe #informar que el archivo no fue
#                                                      encontrado).
#b) Asignar los valores de la columna 2 a la variable 'Td' y el contenido de la columna 3 a
#la variable 'Temperatura'.
#c) Leer s ??olo las primeras 20 l ??ineas del archivo almacenando la primera columna en una
#variable integer, y la segunda y tercera columna en una variable real.
#d) Leer s ??olo las primeras 20 l ??ineas y las primeras 3 columnas.


#a)

rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO 3/Labo-de-datos-R-main/Practicas/Archivos Practica 4")
datos<-"87576.dat"

#Solo se me ocurre un ciclo if y que printee un msj que me diga si lo pudo abrrir o no
#Viendo la teorica y con ayuda de google uso file.exists
#que devuelve un vector lógico indicando si los archivos a los cuales se hace referencia en los argumentos existen.

if(file.exists(datos)){                           #Si el archivo datos existe == TRUE
  print("El archivo, 87576.dat ,fue abierto exitosamente")    #Me printea que esta todo OK
  Tabla_Datos<-read.table(datos,sep="") #Uso lo visto en la teorica y que me Abra el archivo con la sentencia read table
}else{                                            #Sino
  print("No se pudo acceder al archivo 87576.dat")          #Print no exitoso
}

#b) Asignar los valores de la columna 2 a la variable 'Td' y el contenido de 
#la columna 3 a la variable 'Temperatura'.

colnames(Tabla_Datos)<-c("","Td","Temperatura")

#c) Leer solo las primeras 20 lineas del archivo almacenando la primera columna en una
#variable integer, y la segunda y tercera columna en una variable real.

#En la teorica vimos algo magico
#skip: el número de líneas del archivo de datos que deben ser salteados antes de comenzar a leer los datos.
#datos2=read.table(dir_datos,nrows=24,skip=11)  #Saltea 11 filas y aparatir de la fila 12 y me muestra la info

#Le pifie xd, esto me sirve mas jajaj
#datos1=scan(dir_datos,character(),nmax=28) #Hace que sean  caracteres hasta 28 elementos
#datos1                                    #Si no pongo nmax... ME LEE TODO 

#Aplico eso aca, me piden leer las primeras 20 lineas alamcenadas en la primer columna en una cariable integer

PrimeraColumna<-read.table(Tabla_Datos,integer(),nmax=20)
Segunda_Y_Tercera_Columna<-read.table(Tabla_Datos,numeric(),skip = 720,nmax=1440)

#No va ninguno
#Bueno, revise mejor la clase y hay algo que no se si va a funcionar, pero se llama colClasses... #Busque HELP con read.table, tambien fue util
#Asigna las clases c("nombre_clase","nombre_clase2"...)
#Le digo que me tome 20 filas con nrows=20 y listo

tabla2<-read.table(datos, nrows=20, colClasses = c("integer","numeric","numeric")) #Bueno, funciono

#d) Leer solo las primeras 20 lineas y las primeras 3 columnas.

#Ahora si, momento de brillar para el skip y nmax

Tabla3<-read.table(datos,nrows = 20,nmax=60)
Tabla3<-read.table(datos,nrows = 20,ncol= 3)
Tabla3<-read.table(datos,nrows = 20,ncols=3)
Tabla3<-read.table(datos,nrows = 20,nmax=60)
Tabla3<-read.table(datos,nrows = 20)

#EJERCICIO 2##########################################################

#El archivo datos gts.txt contiene datos de estaciones. Visualizar el archivo 
#con un editor de texto y diseniar una funcion de R que requiera como argumento
#el nombre del archivo y que devuelva lo siguiente:

#a) Una lista de estaciones acompaniada de la cantidad de observaciones 
#disponibles para cada estacion.



rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO 3/Labo-de-datos-R-main/Practicas/Archivos Practica 4")
datos<-"datos_gts.txt"

#Abrimos el archivo y vemos que tiene lineas de texto... que no nos interesan. Queremos los datos nomas

tabla1<-read.table(datos, header=FALSE, skip=7)
tabla1

#Vemos que es un hermoso archivo que tiene estaciones y muchos datos mas. Solo nos interesa la primera columna y la cantidad de obs por estacion

#a)

#No tengo idea de como seguir el cilo for 

Estaciones<-function(tabla1){
  Lista<-list()
  Estaciones<-tabla1[[1]]  #En estaciones, guardo todos los nombres que hay en la columna 1
  for (i in 1:length(Estaciones)) {  #Recorre de 1 hasta la longitud de ESTACIONES = 801
    
  }
}


#b) Escribir esta lista en un archivo ascii en dos columnas donde la primera es 
#el nombre de la estación y la segunda es la cantidad de datos. Incluir un 
#encabezado que indique que es cada columna.







#EJERCICIO 3##########################################################

#Dado el archivo sondeo.txt que tiene las observaciones correspondientes al
#sondeo de la localidad de Ezeiza del dia 24 de diciembre de 2008, en el 
#siguiente orden: presion, temperatura, humedad especifica.

#a) Leer los datos y asignar un codigo de -999 a los datos faltantes.

rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO 3/Labo-de-datos-R-main/Practicas/Archivos Practica 4")
datos<-"sondeo.txt"
read.table(datos)

tabla1<-read.table(datos, header=FALSE, sep = " ")
tabla1

#Casi, me devolvio la tabla pero toda junta, tipo no me separo en columnas .-.

#va de vuelta
#Veo que la tabla separa los valores con una... ","!!!!!

tabla1<-read.table(datos, header=FALSE, sep = ",")
tabla1

#mejor, veo un pequeño detalle... Los NA estan con barritas creo mmmm no se que hacer
#HELP read.table... NA.STRINGS!!!

#un vector de caracteres de cadenas que deben interpretarse como valores NA. Los campos en blanco también se consideran valores faltantes 
#en campos lógicos, enteros, numéricos y complejos. 
#Tenga en cuenta que la prueba se realiza después de eliminar el espacio en blanco de la entrada, por lo que es posible que los valores 
#de na.strings necesiten eliminar su propio espacio en blanco por adelantado.

tabla1<-read.table(datos, header=FALSE, sep = ",", na.strings = "//")
tabla1

#No funco...debe faltar algo mas pero la idea parece bien

#La ultima parte del HELP de NA.STRING me dice:
##Tenga en cuenta que la prueba se realiza después de eliminar el espacio en blanco de la entrada, por lo que es posible que los valores 
#de na.strings necesiten eliminar su propio espacio en blanco por adelantado.

#Encontre mas ayuda, strip.white... litralmente es
#tira.blanca lógico. Se usa solo cuando se ha especificado sep y permite eliminar los espacios en blanco iniciales y finales de los campos de caracteres 
#sin comillas (los campos numéricos siempre se eliminan). Consulte el escaneo para obtener más detalles 
#(incluido el significado exacto de "espacio en blanco"), recordando que las columnas pueden incluir los nombres de las filas

#Necesito usar eso me parece

tabla1<-read.table(datos, header=FALSE, sep = ",",strip.white = TRUE, na.strings = "//")
tabla1

tabla1[is.na(tabla1)]=-999.9 # asignar un codigo de -999 a los datos faltantes.


#Costo, pero ya esta. Era eso

#b) Calcular la altura geopotencial de todos los niveles de presion informados
#en el archivo.

#????

#c) Generar un nuevo archivo ascii en donde se incluya toda la informacion
#contenida en el archivo sondeo.txt, pero ademas que incluya una nueva columna 
#con los valores calculados de altura geopotencial.



#EJERCICIO 4##########################################################

#Dado el archivo sondeo2.txt, generar una funcion que permita ingresar el 
#nombre del archivo y que genere como resultado un Data Frame que contenga la 
#siguiente informacion:

#a) Presion, temperatura, relacion de mezcla, altura geopotencial.
#b) Latitud y longitud de la estacion, ID de la estacion y el valor del CAPE.
#Tener en cuenta la cantidad de datos (es decir, de niveles de presion 
#informados en el sondeo es variable)


rm(list = ls())
setwd("D:/Users/Windows 10/Desktop/LABO 3/Labo-de-datos-R-main/Practicas/Archivos Practica 4")
datos<-"sondeo2.txt"

#Veo que es ese sondeo2.txt, necesito skipear 4 filas y que me muestre 17-4 filas = 13

tabla1<-read.table(datos,nrows = 13, skip =4 , header=FALSE, sep = "")
tabla1
#Como nos piden algunos datos especificos, prefiero ponerle nombre a las columnas
colnames(tabla1)<-c("PRES","HGHT","TEMP","DWPT","RELH","MIXR","DRCT","SKNT","THTA","THTE" ,"THTV")

#a) Presion, temperatura, relacion de mezcla, altura geopotencial.

#Me piden un data frame que contenga... lo que dice arriba 
#data_frame<-data.frame()...
#Voy a ver la clase practica de data frame pero creo que la idea es seleccionar la columna que queremos con
#tabla1[,1] o lo que sea que necesitemos y ponerle nombre como hice mas arriba y listo
#...
#few minutes later
#

Funcion_DataFrameA<-function(tabla1) {
  data_frame<-data.frame(tabla1[,1],tabla1[,3],tabla1[,6],tabla1[,2])
  colnames(data_frame)<-c("Presion","Temperatura","Relacion de mezcla","Altura Geopotencial")
  return(data_frame)
}

DataFrame_a<-Funcion_DataFrameA(tabla1)
DataFrame_a

#BIEN

#b) Latitud y longitud de la estacion, ID de la estacion y el valor del CAPE.
#Tener en cuenta la cantidad de datos (es decir, de niveles de presion 
#informados en el sondeo es variable)

#Me piden algo complicado... 
#La longitud esta en la fila 24
#La latitud esta en la fila 23
#El ID de la estacion esta en la fila 20
#El valor del CAPE esta en la fila 34

#Supongo que lo mejor que puedo hacer es lo mismo que arriba, solo que ahora tengo que indicarle que saltee 22 cosas y me de los datos de 1 fila
#tabla1<-read.table(datos,nrows = 13, skip =4 , header=FALSE, sep = "")

#Esta funcion nos lee linea por linea en donde hay informacion que nos sea relevante para este ejercicio
#Por ejemplo, si queremos la ID de la estacion, le pediremos que nos lea todo lo que hay en la linea 20.
#Vemos que se compone de 3 palabras, por lo cual alamcenara 3 columnas con 3 palabras
#"Station" "Identi..." "ID"
#Entonces le pediremos que seleccione esa tercer columna que queremos

Funcion_DataFrameB<-function(tabla1) {
  latitud<-read.table(datos, header=FALSE, skip=22, nrows=1)
  longitud<-read.table(datos, header=FALSE, skip=23, nrows=1)
  ID<-read.table(datos, header=FALSE, skip=19, nrows=1)
  CAPE<-read.table(datos, header=FALSE, skip=33, nrows=1)
  data_frameB<-data.frame(ID[[3.2]],latitud[[3]],longitud[[3.1]],CAPE[[5]])
  colnames(data_frameB) = c("ID Estacion","Latitud", "Longitud",  "CAPE") 
  return(data_frameB)
}
DataFrame_B<-Funcion_DataFrameB(tabla1)
DataFrame_B

#LISTO


#Ejercicio 5
#El archivo modelo.grd es un archivo binario, little endian de acceso directo con precisi ??on
#simple (su correspondiente ctl es modelo.ctl). Dicho archivo almacena las siguientes variables:
#  U, V, T y q en 925, 850, 700, 500, 300 y 100 hPa.
#a) Calcular la temperatura potencial para todos los niveles.
#b) Generar una m ??ascara que valga 1 donde la temperatura potencial de 850 hPa sea mayor
#que la media y -1 donde sea menor que la media en dicho nivel.
#c) Guardar la temperatura potencial (para todos los niveles) en un archivo binario de
#acceso directo con precisi ??on simple big endian. Guardar la m ??ascara generada en un
#archivo binario aparte.
#d) Calcular el promedio zonal de U en 850hPa cada 10 grados. Guardar los datos en un
#archivo ASCII donde una columna indique la latitud y la otra columna el valor del
#promedio.

setwd("D:/Users/Windows 10/Desktop/LABO 3/Labo-de-datos-R-main/Practicas/Archivos Practica 4")

readBin("modelo.grd","wb")

a<-file("modelo.grd")
a

readBin("modelo.grd","rb")

#DSET ^modelo.grd
#TITLE SPEEDY MODEL OUTPUT
#UNDEF -9.99E33
#OPTIONS sequential
#XDEF 96 LINEAR 0.0 3.75
#YDEF 48 LINEAR -87.159 3.7
#ZDEF 7 LEVELS 925 850 700 500 300 200 100
#TDEF  1 LINEAR 00Z01JAN1982 6HR

#VARS 5
#U 7 0 U-wind [m/s]
#V 7 0 V-wind [m/s]
#T 7 0 Temperature [K]
#Q 7 0 Specific Humidity [kg/kg]
#Z 7 0 Geopotential Height [m]
#ENDVARS



nLong<-96
nLat<-48
nAlt<-7
nt<-1
nVars<-5
#UNDEF -9.99E33
faltantes<--9.99E33
N<-nLat*nLong*nAlt*nVars*nt

variable<-readBin("modelo.grd","numeric",n=N,endian = "little",size=4)  
variable

variable[which(variable==faltantes)]<-NA
variable

variable<-array(variable,c(nLong,nLat,nAlt,nVars,nt))  #array de 5 dimensiones 
dim(variable)

#En el puto a) nos pidenCalcular la temperatura potencial para todos los niveles.

#Necesitamos

# 0=T(Po/p)**(R/cp)

# 0= TEmepratura Potencial
# T= Temperatura
# p= Presion 
# p0= Presion de referencia
# R = Cte de gases ideales = 287 J/mol.K
# cp = Calor especifico a presion constante 1004 J/kg.K

#Lo que tenemos que poner en un array son... las presiones!... Junto a las longitudes y a las latitudes!

tpotencial<-array(variable,dim=c(48,96,7)) #nLong<-96 nLat<-48 nAlt<-7
tpotencial
dim(tpotencial)

#Inicicializo variables

Rd<-287
Cp<-1004 
p<-c(925, 850, 700, 500, 300, 200 ,100)

#Armo un ciclo for que haga
# tpotencial=T(Po/p)**(R/cp)
#Por eso, inicialize R y cp que son cte
#Como es dim 7 (las presiones) hago que la iteracion sea de 1 a 7.
#Llame a una variable P que agarre los elemntos a medida que vaya iterando. Osea i=1 p[1]=925
#No voy a mentir, puse variable[,,i,3,], porque asi me daba algo lindo y con sentido.         #PREGUNTAR PORQUE VA EL 3

#VARS 5
#U 7 0 U-wind [m/s]
#V 7 0 V-wind [m/s]
#T 7 0 Temperature [K]                       #POR ESTO VALE 3, PORQUE ESTOY USANDO LA VARIABLE 3, QUE ES TEMPERATURAAAAA!!!AHAHAHA!!!!
#Q 7 0 Specific Humidity [kg/kg]
#Z 7 0 Geopotential Height [m]
#ENDVARS


dim(variable)
for (i in 1:7){
  tpotencial[,,i]<-variable[,,i,3,]*((1000/p[i])^(Rd/Cp))
}

tpotencial #Vemos si funciono
dim(tpotencial) #48 lat 96 lon 7 niveles

#b) Generar una mascara que valga 1 donde la temperatura potencial de 850 hPa 
#sea mayor que la media y -1 donde sea menor que la media en dicho nivel.

#Bien, lo primero seria... mmmm
#Me piden datos de temperatura potencial en 850 HPA, asique, busco la forma de sacar y obtener ese dato mm

Tp_850<-tpotencial[,,2] #Creo que tiene sentido, porque estoy fiando la 3era dim, P[2]=850hpa y dejo libre las demas variables (osea me da todo). 
dim(Tp_850) #Ahora es dim 2 porque estoy fiando la tercera dim

#y tengo que que calcular la media en ese nivel

mean_Tp_850<-mean(Tp_850)

#Bueno y ahora...defino esa cosa llamada "mascara"
#Tomo las longitudes,las latitudes y fio la presion... creo que no hace falta poner el 1 jeje

mascara<-array(variable,c(48,96,1))

#Ahora le indico que en donde sea mayor que la media ponga un 1 y en donde sea menor que ponga -1
#Osea, tomame de mascara la posicion que cumpla que la Tp> o < a la media y si eso es TRUE poneme un 1 o un -1 en ese lugar

mascara[which(Tp_850)>mean_Tp_850]<- 1
mascara[which(Tp_850)<mean_Tp_850]<- -1


#c) Guardar la temperatura potencial (para todos los niveles) en un archivo 
#binario de acceso directo . Guardar la mascara 
#generada en un archivo binario aparte.


#Primero me piden guardar un archivo binario con todos los datos de todos los niveles osea guuardar 48*96*7 datos

#Osea me hago un array, sabiendo que:
#tpotencial<-array(variable,dim=c(48,96,7)) 
#Entonces solo me queda definir el total de datos... lo ingrese como vector, sino me daba error  #PREGUNTAR?????


TPotencial<-array(tpotencial,c(48*96*7))

#Listo, lo guardo y fue
writeBin(TPotencial,endian="little",size=4)

#Me dice algo que de necesita que sea un vector????? Bueno, queres que sea un vector? Ta bien

TPotencial<-as.vector(array(tpotencial,c(48*96*7)))
#Listo, lo guardo y fue
writeBin(TPotencial,endian="big",size=4)

#Busque ayuda con el comando Writebin... "me dice algo del CON" = "con	A connection object or a character string naming a file or a raw vector"
#Ah, que no le puse nombre creo

writeBin(TPotencial,"TPotencial",endian="big",size=4)

#LISTO

#Ahora repito esto pero para "mascara"
#mascara<-array(variable,c(48,96,1))

MascaraBinario<-as.vector(array(mascara,c(48*96*1)))
writeBin(MascaraBinario,"Mascara850Hpa",endian="big",size=4)


#d) Calcular el promedio zonal de U en 850hPa cada 10 grados. Guardar los datos 
#en un archivo ASCII donde una columna indique la latitud y la otra columna el
#valor del promedio.

#Bueno, me piden, "el promedio zonal de u"...???

#VARS 5
#U 7 0 U-wind [m/s]
#V 7 0 V-wind [m/s]
#T 7 0 Temperature [K]
#Q 7 0 Specific Humidity [kg/kg]
#Z 7 0 Geopotential Height [m]
#ENDVARS

#OK el viento entonces, cada 10 gradosy con la presion fijada en 850... 
dim(variable) #Dejamos libre la primera,la segunda, fijamos la 3ra = 850 (osea el elemento [2]) y la 4ta es = 1

#Osea que puedo defenir una variable que me agarre eso que necesito
Viento_U<-array(variable,c(, ,2,1))
#ok, un array no funca creo... mmmmmmm

Viento_U<-variable[,,2,1,]

#Dice cada 10 grados mmm 
