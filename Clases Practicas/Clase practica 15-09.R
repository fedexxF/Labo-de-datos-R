#Ejercicio

#Generar una lista en cuyo primer elemento haya un vector de caracteres con los nombres de los y las alumnas presentes en clase 
#y cuyo segundo elemento sea un vector con las edades de los y las alumnas

#Hacer un promedio de las edades y añadirlo a la lista como tercer elemento

#Calcular la longitud de cada elemento de la lista usando lapply


rm(list = ls())

Clase_Labo <- list(c("Fede","Gaston","Rocio"),c(21,21,20)) #Creo una lista que contenga nombres y vectores edad
Clase_Labo

#AAgregue un elemento a Clase_Labo que sea el promedio de Clase_Labo del elemento 2 

Clase_Labo$Promedio_Edades <- sapply(Clase_Labo[2], function(x) mean(x))

Clase_Labo #Hasta aca nos da la lista + los proms

#Usamos lapply para que nos de la longitud de cada lista

#sintaxis
#lapply(lista, function(x) nombre_funcion(x))

lapply(Clase_Labo, function(x) length(x))


#-------------------------------------------------------------------------

#Llamamos a un data frame por defecto de r

df <- mtcars
df

#Cantidad de filas
#nrow(dataframe)


nrow(df)

#Cantidad de columnas

#ncol(dataframe)


ncol(df)


#Veo las primeras filas

#head(dataframe)


head(df)

df[df$mpg > 20,] #me quedo con las filas en las que se verifique que los valores de la columna "mpg" sean mayores a 20
subset(df, mpg > 20) #me quedo con las filas en las que se verifique que los valores de la columna "mpg" sean mayores a 20


#genero dataframe para agregar al data frame mtcars
df_personas <- data.frame("Personas" = c(rep(4, 4), rep(2, 16), rep(5, 12))) #genero dataframe de 32 filas para poder agregarlo al datafram de antes

# incorporo nombres al dataframe df_personas igual al nombre de las filas de mtcars

df_personas$Model <- rownames(mtcars)
mtcars$Model <- rownames(mtcars)

#combino los data frames
df_combinada <- merge(mtcars, df_personas)
head(df_combinada)

desordeno <- mtcars[c(1, 12, 2:11)] #llevo columna 12 a la posicion de la columna 2
head(desordeno)

#------------------------------------------------------------------------
#Ejercicio

#Generar un data frame con dos columnas: una con los valores de la base de 4 parcelas rectangulares 
#y otra con los valores de la altura de esas parcelas.
#Calcular la superficie de cada parcela e incorporarla al dataframe como una nueva columna




Parcelas_rectangular <- data.frame(Base = c(10,25,15,3), Altura = c(10,15,10,6))
Parcelas_rectangular


#Accedemos a los elementos que queremos con
#dataframe[[numero_columna]]

Parcelas_rectangular[1,]
Parcelas_rectangular[2,]

Areas<- Parcelas_rectangular[[1]]*Parcelas_rectangular[[2]]
Areas


#al final tengo que aplicamos lo mismo que con listas
#Ups cree una lista jajajjaja asi no

Parcelas_rectangular<- list(Base = c(10,25,15,3), Altura = c(10,15,10,6), c(Areas))
Parcelas_rectangular

#al final tengo que aplicamos lo mismo que con listas PERO NO USO LIST USO DATA.FRAME!!!!

Parcelas_rectangular<- data.frame(Base = c(10,25,15,3), Altura = c(10,15,10,6), Areas)
Parcelas_rectangular

Parcelas_rectangular<- rbind(Base = c(10,25,15,3), Altura = c(10,15,10,6), Areas)
Parcelas_rectangular

Parcelas_rectangular<- cbind(Base = c(10,25,15,3), Altura = c(10,15,10,6), Areas)
Parcelas_rectangular

#VER CLASE NADIA QUE LO HACE MEJOR :C


