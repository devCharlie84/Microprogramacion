## Laboratorio #5
### “Instrucciones básicas: Ciclos”

Instrucciones de Transferencia de Control (Continuación) 
 
✓ LOOP etiqueta <br>
➢ Salta a etiqueta si el registro CX es distinto de 0. Además, decrementa el valor de CX. <br>
➢ Esta instrucción se utiliza para implementar ciclos. Para ello, se inicializa CX con el número de iteraciones que debe realizar el ciclo y, posteriormente, se colocan aquellas instrucciones que se desean ejecutar de forma iterativa, delimitadas por la etiqueta y la instrucción LOOP. <br>
 
✓ LOOPE / LOOPZ etiqueta 
 
➢ Salta si la bandera Z es 1 y CX es distinto de 0. Decrementa CX. 
 
✓ LOOPNE / LOOPNZ etiqueta 
 
➢ Salta si la bandera Z es 0 y CX es distinto de 0. Decrementa CX. 
 
✓ INT n 
 
➢ Ejecuta el manejador de la interrupción especificada en el operando. 
