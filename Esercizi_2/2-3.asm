# Implementare un programma in linguaggio assembly MIPS che legga da input un intero e 
# calcoli il numero di 1 della sua rappresentazione binaria.
# Esempio
# INPUT: 521 (in binario 1000001001)
# OUTPUT:3

.eqv ITER, $t9
.eqv DIM, $t8
.text
.globl main
main:
	la $a0, str_input
	li $v0, 4
	syscall 
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	li ITER, 1
	li DIM, 32
FOR:
	and $t2, $t1, 1
	add ITER, ITER, 1	
	ble ITER, DIM, FOR
	
	la $a0, str_output
	li $v0, 4
	syscall
	
	li $v0, 10
	syscall

.data
str_input: .asciiz "INPUT: "
str_output: .asciiz "OUTPUT: "