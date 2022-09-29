#Temas: Lectura y escritura de datos en R
##Ejercicio 1
#El archivo de datos 87576.dat es un archivo ascii. Abrir el archivo 87576.dat en modo solo
#lectura.
#a) Verificar que la apertura del archivo fue exitosa (impedir que el c ́odigo se interrumpa
#                                                      si el archivo no se encuentra, en este caso el script debe #informar que el archivo no fue
#                                                      encontrado).
#b) Asignar los valores de la columna 2 a la variable ‘Td’ y el contenido de la columna 3 a
#la variable ‘Temperatura’.
#c) Leer s ́olo las primeras 20 l ́ıneas del archivo almacenando la primera columna en una
#variable integer, y la segunda y tercera columna en una variable real.
#d) Leer s ́olo las primeras 20 l ́ıneas y las primeras 3 columnas.


#a)

setwd("~/Escritorio/LABO")

load("87576.dat")



#Ejercicio 5
#El archivo modelo.grd es un archivo binario, little endian de acceso directo con precisi ́on
#simple (su correspondiente ctl es modelo.ctl). Dicho archivo almacena las siguientes variables:
#  U, V, T y q en 925, 850, 700, 500, 300 y 100 hPa.
#a) Calcular la temperatura potencial para todos los niveles.
#b) Generar una m ́ascara que valga 1 donde la temperatura potencial de 850 hPa sea mayor
#que la media y -1 donde sea menor que la media en dicho nivel.
#c) Guardar la temperatura potencial (para todos los niveles) en un archivo binario de
#acceso directo con precisi ́on simple big endian. Guardar la m ́ascara generada en un
#archivo binario aparte.
#d) Calcular el promedio zonal de U en 850hPa cada 10 grados. Guardar los datos en un
#archivo ASCII donde una columna indique la latitud y la otra columna el valor del
#promedio.

setwd("~/Escritorio/LABO")

readBin("modelo.grd","wb")

a<-file("modelo.grd")
a

readBin("modelo.grd","rb")

nLong<-96
nLat<-48
nAlt<-7
nt<-1
nVars<-5

faltantes<--999
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

#Lo que tenemos que poner en un array son... las presiones!...
p<-c(925,850,700,500,300,200,100)

#Necesitamos un array que deje fijas las otras variables


