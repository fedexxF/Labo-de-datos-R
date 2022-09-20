source("f_mi_suma_codigo.R")
print(f_mi_suma)

suma<-f_mi_suma(5,6)
print(suma)

#Las funciones ya de base de R se hicieron de la misma forma que ariba. si ponemos en consola ?mean nos manda al help y nos muestra la logica de la funcion

mean(c(3,NaN,5), na.rm = TRUE) 

#Ejercicio

#Generar una función en la que se ingresen tres vectores de longitud 4: dos vectores numericos 
#y un tercero character y se devuelva un dataframe con una columna llamada “base” que contenga el primer vector como datos 
#y otra llamada “altura” que contenga el segundo vector como datos. Los nombres de las filas estarán dados por el tercer argumento (vector character).

#Modificar la funcion anterior para que el dataframe de salida tenga una columna llamada “superficie” donde esten los datos de la superficie 
#dada por el dato de base y altura de cada fila

#Agregar unas lineas que chequeen que el vector_1 y vector_2 sean numéricos y que vector_1 vector_2 y vector_3 
#sean del mismo largo y sino que interrumpa la funcion


rm(list = ls())

#Funcion que va a pedir el ingreso de 3 vectores, dos numericos y uno como character
#Los dos vectores seran acomodados verticalmente en la columna "Base" (primer vector) y "Altura" (segundo vector)
#EL tercer vector, que es un character, sera el nombre de las filas (por eso tiene longitud 4, osea la longitud de los vectores)
#Se guardara todo en un data frame

#El primer valor sera la columna "BASE"
#El segundo valor sera la columna "Altura"
#El terver valor sera el nombre de las filas. Por default sera c("Fila 1","Fila 2","Fila 3","Fila 4")

funcion_1<-function (vector1,vector2,Character=c("Fila 1","Fila 2","Fila 3","Fila 4")){
  Data_Frame<-data.frame("Base" = c(vector1),"Altura"= c(vector2))
  rownames(Data_Frame)<-c(Character)
  return(Data_Frame)
  
}

#Probamos la funcion

funcion_1(c(1,2,3,4),c(1,2,3,4),c("hola","hola2","hola3","hola4"))
funcion_1(c(1,2,3,4),c(1,2,3,4))

#Modificar la funcion anterior para que el dataframe de salida tenga una columna llamada “superficie” donde esten los datos de la superficie 
#dada por el dato de base y altura de cada fila

#Le agregamos algo de manipulacion al data frame. Lo que hacemos es definir la variable superficie, 
#tomar del data frame las columnas "Base" y "Altura", multiplicarlas y guardarlas en un otra columna, llamada "Superficie"


funcion_2<-function (vector1,vector2,Character=c("Fila 1","Fila 2","Fila 3","Fila 4")){
  Data_Frame<-data.frame("Base" = c(vector1),"Altura"= c(vector2))
  rownames(Data_Frame)<-c(Character)
  sup <- Data_Frame$Base * Data_Frame$Altura
  Data_Frame$Superficie <- sup
  return(Data_Frame)
  
}

#Probamos la funcion

funcion_2(c(1,2,3,4),c(1,2,3,4),c("hola","hola2","hola3","hola4"))
funcion_2(c(1,2,3,4),c(1,2,3,4))


#Agregar unas lineas que chequeen que el vector_1 y vector_2 sean numéricos y que vector_1 vector_2 y vector_3 
#sean del mismo largo y sino que interrumpa la funcion


funcion_3<-function (vector1,vector2,Character=c("Fila 1","Fila 2","Fila 3","Fila 4")){
  
  if (is.numeric(vector1)==FALSE) stop("vector1 no es un número")
  else if (!is.numeric(vector2)) stop("vector2 no es un número")
  else if (length(vector1)!=length(vector2) | length(vector1)!=length(Character) | length(vector2)!=length(Character)) stop("vector1, vector2 y vector 3 no tienen la misma longitud")
  
  
  Data_Frame<-data.frame("Base" = c(vector1),"Altura"= c(vector2))
  rownames(Data_Frame)<-c(Character)
  sup <- Data_Frame$Base * Data_Frame$Altura
  Data_Frame$Superficie <- sup
  return(Data_Frame)
  
}

#Probamos la funcion

funcion_3(c(1,2,3,4),c(1,2,3,4),c("hola","hola2","hola3","hola4"))
funcion_3(c(1,2,3,4),c(1,2,3,4))

#Probamos los posibles errores para que stopee la funcion
funcion_3(c(1,2,3,4),c(1,2,3),c("hola","hola2","hola3","hola4"))
funcion_3(c(1,2,3),c(1,2,3,4),c("hola","hola2","hola3","hola4"))
funcion_3(c(1,2,3,4),c(1,2,3,4),c("hola","hola2","hola3"))
funcion_3(c("hola"),c(1,2,3,4))
funcion_3(c(1,2,3,4),c("hola"))


#########################################
#ES lo mismo que funcion_3 pero con valores por default

funcion_4<-function (vector1 = c(0,0,0,0),vector2= c(0,0,0,0),Character=c("Fila 1","Fila 2","Fila 3","Fila 4")){
  
  if (is.numeric(vector1)==FALSE) stop("vector1 no es un número")
  else if (is.numeric(vector2)==FALSE) stop("vector2 no es un número")
  else if (length(vector1)!=length(vector2) | length(vector1)!=length(Character) | length(vector2)!=length(Character)) stop("vector1, vector2 y vector 3 no tienen la misma longitud")
  
  
  Data_Frame<-data.frame("Base" = c(vector1),"Altura"= c(vector2))
  rownames(Data_Frame)<-c(Character)
  sup <- Data_Frame$Base * Data_Frame$Altura
  Data_Frame$Superficie <- sup
  return(Data_Frame)
  
}

#Todo OK

funcion_4()

