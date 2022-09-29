#################################################
# ejemplo14.R
# Laboratorio de Procesamiento de Información Meteorológica
# 2º cuatrimestre 2018
################################################# 

# lectura de datos ascii que contienen datos faltantes:
# test1.dat
# 1, 2, 3
# 4, ,  6
#  , 8, 9

rm(list=ls())
dir_datos='C:/Users/PC/Documents/MATERIAS/DOCENCIA/Computacion_2018/test1.dat'
fid = file(dir_datos);	
D = matrix(scan(fid,integer(),sep=','),ncol=3,byrow=TRUE)
D

