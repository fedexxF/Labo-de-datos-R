
#Datos inventados para tener un array con el cual hacer algo jaja

DATOS=array(NA,dim=c(120,4))

DATOS[,1]=rep(2001:2010,each=12)
DATOS[,2]=rep(1:12)
DATOS[,3]=rnorm(120,15,3)
DATOS[,4]=rnorm(120,40,50)

###############################################################################

#Aca empieza el ejercicio

cond=which(DATOS[,2]==9 | DATOS[,2]==10 | DATOS[,2]==11) #Selecciono e impongo condiciones para la columna 2
cond

DATOS_SEP_OCT_NOV=DATOS[cond,]
dim(DATOS_SEP_OCT_NOV)

tmp_SEP_OCT_NOV=DATOS_SEP_OCT_NOV[,3]
tmp_SEP_OCT_NOV

#Todo junto seria...

temp<-DATOS[cond,3]
temp

#Finalemnte armo el array

Primavera=array(tmp_SEP_OCT_NOV,c(3,10))
Primavera

#y uso apply

temp_promedio<-apply(Primavera,c(2),mean)
temp_promedio



#Repito el proceso

Precipitacion<-DATOS[cond,4]

pp=DATOS_SEP_OCT_NOV[,4]
pp

Primavera1=array(pp,c(3,10))
Primavera1
pp_acumulado<-apply(Primavera1, c(2), sum)


u<-array(NA, c(10,2))
rownames(u)<-c(2001:2010)
u[,1]<-temp_promedio
u[,2]<-pp_acumulado
colnames(u)<-c("Temperatura Promedio","Precipitacion acumulada")
u

########################################################################
#######################################################################
############################################################################

a<-which(u<=20)
a

length(a)


Lista <- list(Nombre =c("Maria","Fede","Rodri"), Apellido = c("Messi","Messi1","Messi3"), edad= c(10,11,22))
Lista

Lista$Numeros<-c(1,2,3)

Inicial<-0
for (i in 1:length(Lista$Nombre)) {
  Inicial[i]<-substr(Lista$Nombre[i],1,1)
  i+1
  
}

Inicial
substr(Lista$Nombre[3],1,1)


data_frame<-data.frame(Numeros=c(10:1000))
data_frame$MEDIA<-mean(data_frame$Numeros)
data_frame



###########################

x<-3 
t<- "pepe"
L<-FALSE

as.numeric(t)
as.numeric(L)
x>0 | L
L &! is.logical(t)
paste(t,x)

a<-pi/2
b<-0
while(cos(a)==b & a<4*pi){
    print(a)
    print(b)
    a<-a +pi/2
}


DATOS=array(NA,dim=c(12,3))

DATOS[,1]=rep(2001:2010,each=12)
DATOS[,1]=rep(1:12)
DATOS[,2]=rnorm(12,15,3)
DATOS[,3]=rnorm(12,40,50)


MESES=c("E","F","M","a","m","J","J2","A2","S","O","N","D")

DF<-data.frame(MESES,DATOS)
row.names(DF)= MESES

Condicinal_V<-which(DF[,1]=="D" | DF[,1]=="E" | DF[,1]=="F")
Condicinal_I<-which(DF[,1]=="J" | DF[,1]=="J2" | DF[,1]=="A2")


TEMP_V<-DF[Condicinal_V,3]
TEMP_I<-DF[Condicinal_I,3]


TEMP_DEF<-array(TEMP_V,c(3,1))
TEMP_JJA<-array(TEMP_I,c(3,1))


prom_V<-apply(TEMP_DEF,c(2),mean)
prom_I<-apply(TEMP_JJA,c(2),mean)


Lista<-list("Promedio de Temperatura Verano" = c(prom_V),"Promedio de Temperatura Invierno" = c(prom_I))
print(Lista)


a<-c(5,12.1,7.2,8.2,3.5,2.0,5.8,10.4,1.7,6.0,5.3,0.5)

A<-matrix(a,nrow = 6, byrow = TRUE)
A

B<-matrix(a,nrow = 2,byrow = FALSE)
B


x1<-c(1,2,3)
x2<-c(4,5,6)
x3<-c(0,0,0)

XC<-cbind(x1,x2,x3)

is.matrix(XC) | is.matrix(x1)

dim(XC)

XR<-rbind(x1,x2,x3)
XR

2*XC

XC%*%XR
