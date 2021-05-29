# Implementare un programma in linguaggio assembly MIPS che:
# stampa a video “Primo numero: ” e prenda in input un numero a
# stampa a video “Secondo numero: ” e prenda in input un numero b
# stampa a video “Prodotto dei due numeri: ” e stampi a video axb

# Esempio
# OUTPUT: Primo Numero:
# INPUT:5
# OUTPUT:Secondo Numero:
# INPUT:6
# OUTPUT: Prodotto dei due numeri:30

.eqv An, $t9
.eqv Bn, $t8

.text
.globl main

main:
	la $t1, str_primonumero
	move $a0, $t1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move An, $v0
	
	la $t1, str_secondonumero
	move $a0, $t1
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move Bn, $v0
	
	la $t1, str_prodotto
	move $a0, $t1
	li $v0, 4
	syscall
	
	mul $a0, An, Bn
	li $v0, 1
	syscall
	
	
	li $v0, 10
	syscall
	
	
	
	

.data
str_primonumero: .asciiz "Primo numero: "
str_secondonumero: .asciiz "Secondo numero: "
str_prodotto: .asciiz "Prodotto dei due numeri: "