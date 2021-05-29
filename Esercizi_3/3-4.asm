# Dato un intero positivo a definito in memoria, stampare a video "Terzo bit 1" nel caso in cui 
# il terzo bit del numero a sia 1 o  "Terzo bit 0" altrimenti


.text
.globl main

main: 

#	Lettura del valore definito in memoria e definzione del valore 4
	lw $t1, a
	
	li $t2, 4
	
#	AND bit a bit e controllo del risultato
	and $t2, $t1, $t2
	
#	Condizione per settare l'output
	beq $t2, 4, SETLABEL
	
	la $a0, false
	
EXIT: 
#	Stampa dell'output e termine del programma
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall
	
	
SETLABEL:
	la $a0, true
	j EXIT

.data
a: .word 2
true: .asciiz "Terzo bit 1"
false: .asciiz "Terzo bit 0"