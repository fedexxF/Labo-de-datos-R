rm(list=ls())
graphics.off()

head(iris)

library(ggplot2)
# Datos + esteticas
g <- ggplot(iris, aes(x=Petal.Length, y=Petal.Width)) #Primero inidicamos el array de dodne salen los datos.
g                                                     #usa como x la longitud y como y el ancho de los petalos
                                                      #Prepara todo para graficar

#Capa geometrica (scatter plot)
g <- g + geom_point(aes(colour=Species),size=2) #Geom_point es un grafico de puntos lindos
g                                               #Cuyo nombres y tamaños son los indicados



#Capa de facetas
g <- g + facet_wrap(Species~., ncol=1) #facet_wrap te divide el grafico
g                                      #Te lo divide por "Especie"

#Capa estadistica
g <- g + stat_smooth(aes(group=Species), #stat_smooth traza una linea. divide por gruṕs de especies
                     method = "lm",      #lm es linear modal, osea una regresion lineal y=x
                     formula = y~x,       
                     col="black")       #Color negro
g

#Capa de coordenadas 
g <- g + coord_flip() #da vueltas las coordenas. Tamaño de petalos ahora es el eje x
g

#Capa de tema
g <- g + theme_bw() #Es un tema cargado por defecto
g
#Con la funcion theme podemos personalizar nuestro propio tema 


#Agrego titulo, subtitulo, etiquetas de eje y de leyenda
#Cambio los colores 
g <- g + labs(title="Petalos de Iris",
               subtitle="Comparación entre especies",
               x="Ancho del pétalo [cm]",
               y="Largo del pétalo [cm]",
               colour="Especie",
               shape="Especie")+
  scale_color_manual(values=c("#C70CED","#4100E0","#0C45ED"))


g

#Guardo la imagen
ggsave("figuras/iris.jpg",dpi=300, #Donde se guarda?En la carpeta figuras. COn que nombre?Iris.jpg
       width=15,                   
       height=10,
       units="cm")                  #SE especifican las unidades

#SETEAR ANTES LA DIRECCION DE TRABAJO, sino el save no tiene idea de donde esta parado
#Buscar gggplot2 :: Cheat-Sheet
#https://ggplot2.tidyverse.org/reference/



