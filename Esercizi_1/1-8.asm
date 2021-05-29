#Un utente inserisce da tastiera una serie di numeri interi positivi,
#ed il termine della serie è indicato dall’inserimento del valore -1. Il programma in linguaggio assembly MIPS, 
#al termine dell’inserimento, stampa quanti numeri in totale sono stati inseriti
#NB:la stampa deve avvenire da consolle output dell'emulatore MARS 

.eqv CONT, $t9

.text 
.globl main

main:
	li $t2, -1
	li CONT, 0
WHILE:
	li $v0, 5
	syscall
	move $t1, $v0
		
	beq $t1, $t2, EXIT
	
	add CONT, CONT, 1
	
	j WHILE
	
EXIT:
	li $v0, 1
	move $a0, CONT
	syscall
	
	li $v0, 10
	syscall
.data
