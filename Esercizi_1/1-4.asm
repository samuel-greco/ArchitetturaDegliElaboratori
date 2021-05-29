# TRACCIA 4
# Descrivere l'algoritmo che dato un numero intero maggiore di 2 (definito in memoria) 
# stabilisca se il numero è primo (valore 1 in $t2) o no (valore 2 in $t2). 
# Provare ad implementare il programma utilizzando l'emulatore MARS.
# Esempio numeri primi 1,3,5,7,11,13,...
# PS: un numero è primo solo se è divisibile per se stesso e per 1.


.eqv CONT, $t9
.eqv LIMIT, $t8


.text
.globl main

main:
	lw $t1, n
	li CONT, 2
	sub LIMIT, $t1, 1
	li $t2, 1
	

EXIT:
	li $v0, 10
	syscall


.data
n: .word 1
