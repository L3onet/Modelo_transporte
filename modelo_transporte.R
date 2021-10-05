# Se requiere distribuir la producción de 3 plantas situadas 
# en las ciudades de León, Guadalajara y Monterrey, con una 
# producción mensual de 500, 350 y 200 unidades respectivamente, 
# a 3 clientes en las ciudades de León, Culiacán y Villahermosa, 
# con una respectiva demanda mensual de 400, 350 y 300 unidades. 
# Los costos de transporte por unidad se muestran en la siguiente 
# tabla:

# De/hacia	  León	Culiacán	Villahermosa
# León		    10	  30		    60
# Guadalajara	20	  50		    30
# Monterrey	  15	  45		    50

# ¿De qué manera puede minimizarse el costo de transporte?
  
library(lpSolve)

# matriz de flete
costos<-matrix(c(10,20,15,30,50,45,60,30,50), nrow = 3) 
costos

#Símbolo de restricción de salida
row.signs <-rep ("<=", 3) 
row.signs

# Vector de restricción de salida
row.rhs <-c (500,350,200) 
row.rhs

#Símbolo de restricción de ventas
col.signs <-rep ("=", 3) 
col.signs

# Vector de restricción de ventas
col.rhs <-c (400,350,300) 
col.rhs

# Ejecutamos la función y se guarda el resultado en res
res<-lp.transport(costos,"min",row.signs,row.rhs,col.signs, col.rhs)

# Se muestra el resultado de la función 
# objetivo o el costo total mínimo
res

# Se muestra la tabla con los totales de envío
res$solution