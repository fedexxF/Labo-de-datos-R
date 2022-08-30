#Arme un código que : 

# 1. Elimine todos los posibles elementos del Enviroment
# 2. Fije su espacio de trabajo en una carpeta del escritorio con su nombre
# 3. Defina: 
# 
# x <- 12.3
# y <- 12L
# 
# 4. Indiqué de qué clase son x e y 
# 5. Indiqué si son de doble precisión 
# 6. Imprima por pantalla la frase ("DCAO 2022") sin comillas 
# 7. Repita el ítem anterior pero en dos pasos:
#   Pida por pantalla el año actual 
#   Pegue la palabra "DCAO" y el año ingresado para formar la frase del punto 7
#   Imprima el resultado por pantalla
#Ayuda: utilice la función readline o print de R

#***Aclaración: Comente en cada paso que está realizando
2
rm(list=ls()) # Borra todas las variables creadas previamente

#Definimos la rama en la cual estamos trabajando

setwd("~/Escritorio/R clases/Labo-de-datos-R")

#Vemos en que rama estamos trabajando

getwd()

#Definir variables x e y

x<-12.3
y<-12L

#Queremos averiguar que tipo de caracter es
class(x)
class(y)

#Indicamos si son de doble precision 

is.double(x)
is.double(y)

#Imprimimos la palabra "DCAO 2022" SIN las comillas.
#PASTE sirve para pegar "una cosa" + "otra cosa" = una cosa otra cosa. (no tiene sentido usarlo con una palabra)
paste("dcao")

#Imprimimos la palabra "DCAO 2022" SIN las comillas.

z<- "DCAO 2022"
print(z, quote = FALSE)
#Otras formas
cat(z)
noquote("DCAO 2020")

# NUMERO 7

#Para usar readline, le pedimos que nos genere un argumento ("texto intrucctivo que aparecera en la consola")
#El usuraio seguira esa intruccion y , atravez de la consola, cargara una variable que cumpla dicha instruccion
#En este caso, nos piden el año actual, ingresaremos 2020.

AnoAcutual<-readline("Ingresar el ano actual:") 

print(paste("DCAO",AnoActual, sep = " "),quote=FALSE)



#Me lo robe
#creo una variable que sea el resultado de lo ingresado en la consola

añoactual<-readline("Ingrese el año actual:") 

#uso paste para separar las palabras concatenado
print(paste("DCAO",añoactual,sep=" "),quote=FALSE) 




