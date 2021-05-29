#Un utente introduce da tastiera due numeri interi (INIT e LUNG). Il programma in linguagguo assembly 
#MIPS deve stampare una serie di numeri interi consecutivi. 
#La serie inizia al valore INIT ed è lunga LUN elementi.


.eqv INIT, $t9
.eqv LUN, $t8
.eqv TEMP, $t7
.eqv CONT, $t6

.text
.globl main

main:

# Acquisisco i valori INIT e LUN dall'utente
	li $v0, 5
	syscall
	
	move INIT, $v0
	
	li $v0, 5
	syscall
	move LUN, $v0
#############################################
	
	move TEMP, INIT
	
GO:
	li $v0, 1
	move $a0, TEMP
	syscall

	add CONT, CONT, 1
	add TEMP, TEMP, 1
			
	beq CONT, LUN, EXIT
	
	j GO
EXIT:
	li $v0, 10
	syscall
	
		

.data