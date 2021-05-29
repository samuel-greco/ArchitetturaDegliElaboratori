#Si scriva un programma in linguaggio assembly MIPS che legga da tastiera una serie di numeri interi 
#ino a quando la somma di tutti i numeri introdotti ﬁno a quel momento non supera il valore 1000. 
# quel punto, il programma stampa il valore del prodotto di tutti i numeri inseriti.
 

.eqv ACC, $t9
.eqv BASE, $t8
.eqv PROD, $t7

.text
.globl main

main:
	li BASE, 10
	li ACC, 0
	li PROD, 1
WHILE:
	li $v0, 5
	syscall
	move $t1, $v0
	add ACC, ACC, $t1
	
	mul PROD, PROD, $t1
	bgt ACC, BASE, EXIT
	
	j WHILE

EXIT:
	li $v0, 1
	move $a0, PROD
	syscall 
	
	li $v0, 10
	syscall

.data
