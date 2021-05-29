# TRACCIA 3
# Implementare il seguente programma: $t0=1 se il valore della variabile Memole, 
# definita in memoria, ha alla terza posizione meno significativa un 1.

.text
.globl main

main:
	lw $t1, Memole
	li $t2, 4
	
	
	and $t3, $t1, $t2
	
	bne $t3, $t2, exit
	
	li $t0, 1
exit:
	li $v0, 10
	syscall 

.data
Memole : .word 14