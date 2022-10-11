##################
##################################################################
# # Laboratorio de Procesamiento de Informaci�n Meteorol�gica/Oceanografica
# 2� cuatrimestre 2022
##################################################################


# cuando no me deja cargar una libreria poner:
options(repos ='http://cran.rstudio.com') 

##################################################

# Clase Excel Alumnos
#################


require(gdata)
# si trabajamos en Windows y tenemos problemas (ver ppt)
installXLSXsupport(perl = 'C:/Strawberry/perl/bin/perl.exe')


xlsfile<-file.path(path.package('gdata'),'xls','iris.xls')
xlsfile
iris<-read.xls(xlsfile)
iris1<-read.xls(xlsfile,method="csv")
iris2<-read.xls(xlsfile,method="tab")

class(iris)
head(iris)


##########################
exampleFile<-file.path(path.package('gdata'),'xls','ExampleExcelFile.xls')
sheetCount(exampleFile)

sheetNames(exampleFile)

data<-read.xls(exampleFile)
data2<-read.xls(exampleFile,sheet = 2)
data3<-read.xls(exampleFile,sheet = 'Sheet Second')
data4<-read.xls(exampleFile,sheet = 'Sheet with initial text',skip=2)



#############################
## EJEMPLO

meteo<-file.path('datos.xls')
sheetCount(meteo)
sheetCount("datos.xls") 

sheetNames("datos.xls")

meteo_0<-read.xls(meteo,sheet=2)
meteo_1<-read.xls("datos.xls",sheet = 2)

head(meteo_1)
class(meteo_1)
correlacion<-cor(meteo_1[,1],meteo_1[,2]) 

meteo_2<-read.xls(meteo,sheet = 3)
head(meteo_2)
class(meteo_2)
plot(meteo_2[,3],type="l")
plot(meteo_2[1:12,5],type="h")

medias<-apply(meteo_2[,3:5],2,mean)

medias_onda<-matrix(0,nrow=12,ncol=3)
for (i in 1:12){
  a=which(meteo_2[,2]==i)
  medias_onda[i,1:3]<-apply(meteo_2[a,3:5],2,mean)
}

plot(medias_onda[,1],type="l",col='red',ylim=c(0,30))
lines(medias_onda[,2],type="l",col='blue')



