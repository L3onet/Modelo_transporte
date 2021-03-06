# Se requiere distribuir la producci�n de 3 plantas situadas 
# en las ciudades de Le�n, Guadalajara y Monterrey, con una 
# producci�n mensual de 500, 350 y 200 unidades respectivamente, 
# a 3 clientes en las ciudades de Le�n, Culiac�n y Villahermosa, 
# con una respectiva demanda mensual de 400, 350 y 300 unidades. 
# Los costos de transporte por unidad se muestran en la siguiente 
# tabla:

# De/hacia	  Le�n	Culiac�n	Villahermosa
# Le�n		    10	  30		    60
# Guadalajara	20	  50		    30
# Monterrey	  15	  45		    50

# �De qu� manera puede minimizarse el costo de transporte?
  
library(lpSolve)

# matriz de flete
costos<-matrix(c(10,20,15,30,50,45,60,30,50), nrow = 3) 
costos

#S�mbolo de restricci�n de salida
row.signs <-rep ("<=", 3) 
row.signs

# Vector de restricci�n de salida
row.rhs <-c (500,350,200) 
row.rhs

#S�mbolo de restricci�n de ventas
col.signs <-rep ("=", 3) 
col.signs

# Vector de restricci�n de ventas
col.rhs <-c (400,350,300) 
col.rhs

# Ejecutamos la funci�n y se guarda el resultado en res
res<-lp.transport(costos,"min",row.signs,row.rhs,col.signs, col.rhs)

# Se muestra el resultado de la funci�n 
# objetivo o el costo total m�nimo
res

# Se muestra la tabla con los totales de env�o
res$solution