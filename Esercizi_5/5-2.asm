# Un programma in linguaggio assembly MIPS deve leggere dall’utente due vettori di 5 numeri interi ciascuno.
# Il programma deve creare un ulteriore vettore, che contenga la copia dei soli elementi pari
# presenti nei due vettori di partenza, e stampare tale vettore.

.eqv FIRST_ADDR, $t0
.eqv SECOND_ADDR, $t1
.eqv CONT, $t2
.eqv ITER, $t3
.eqv SECOND_ITER, $t6
.eqv REMAINDER, $t4
.eqv THIRD_ADDR, $t5


.text
.globl main

main : 

	la FIRST_ADDR, vettore1
	la SECOND_ADDR, vettore2
	la THIRD_ADDR, vettore3
	
	#Inizializziamo contatore 
	li CONT, 5
	li ITER, 0	
ciclo1:
	# Chiediamo 5 valori all'utente
	li $v0, 5
	syscall

	rem REMAINDER, $v0, 2
	beqz REMAINDER,  salvaelemento1 

continuaciclo1:
	# Memorizza l'elemento all'interno del vettore 1
	sw $v0, (FIRST_ADDR)
	add FIRST_ADDR, FIRST_ADDR, 4
	add ITER, ITER, 1
	blt ITER, CONT, ciclo1
	
	# Riporta iteratore a 0 
	xor ITER, ITER, ITER
	
ciclo2:
	# Chiediamo 5 valori all'utente
	li $v0, 5
	syscall
	
	
	rem REMAINDER, $v0, 2
	beqz REMAINDER,  salvaelemento2

continuaciclo2:
	# Memorizza l'elemento all'interno del vettore 1
	sw $v0, (SECOND_ADDR)
	add SECOND_ADDR, SECOND_ADDR, 4
	add ITER, ITER, 1
	blt ITER, CONT, ciclo2


	xor ITER, ITER, ITER
	
	la THIRD_ADDR, vettore3
	
stampa:
	lw $t9, (THIRD_ADDR)
	move $a0, $t9
	li $v0, 1
	syscall
	add THIRD_ADDR, THIRD_ADDR, 4
	add ITER, ITER, 1
	blt ITER, SECOND_ITER, stampa

exit:	
	li $v0, 10
	syscall


salvaelemento1:
	sw $v0, (THIRD_ADDR)
	add THIRD_ADDR, THIRD_ADDR, 4
	add SECOND_ITER, SECOND_ITER, 1
	j continuaciclo1
salvaelemento2:
	sw $v0, (THIRD_ADDR)
	add THIRD_ADDR, THIRD_ADDR, 4
	add SECOND_ITER, SECOND_ITER, 1
	j continuaciclo2
.data
vettore1: .word 0:5
vettore2: .word 0:5
vettore3: .word 0:10