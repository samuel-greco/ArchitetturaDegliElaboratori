# Scrivere un programma in linguaggio assembly MIPS che riceve in ingresso una sequenza di N numeri interi.
# I numeri sono memorizzati in un vettore. Il valore N è inserito dall’utente prima della lettura del vettore
# ma il vettore può contenere al massimo 30 numeri.
# Terminato l’inserimento della sequenza di numeri, il programma deve verificare se il vettore
# contiene una sequenza di numeri ordinata in modo strettamente crescente.

.eqv N, $t0
.eqv CONT, $t1
.eqv INDEX, $t2
.eqv ELEMENT, $t3

.text
.globl main
main:
	# Acquisisci input utente -> N
	li $v0, 5
	syscall
	bgt $v0, 30, fine
	move N, $v0
getvett:
	# Acquisisci N elementi e memorizzali nel vettore
	li $v0, 5
	syscall
	
	mul INDEX, CONT, 4
	sw $v0, vettore1(INDEX)
	
	add CONT, CONT, 1
	blt CONT, N, getvett
	
	xor INDEX, INDEX, INDEX
	xor CONT, CONT, CONT
	
	
	mul INDEX, CONT, 4
	lw $t9, vettore1(INDEX)
	add CONT, CONT, 1
	
checkorder: 
	mul INDEX, CONT, 4
	lw ELEMENT, vettore1(INDEX)
	
	ble ELEMENT, $t9, stampacasuale
	
	move $t9, ELEMENT
	add CONT, CONT, 1
	blt CONT, N, checkorder


	la $a0, ordcrescente
		
fine: 	
	li $v0, 4
	syscall	
	li $v0, 10
	syscall

stampacasuale:
	la $a0, ordcasuale
	j fine

.data
vettore1: .word 0:30
ordcrescente: .asciiz "\nOrdinamento strettamente crescente."
ordcasuale: .asciiz "\nOrdinamento casuale."