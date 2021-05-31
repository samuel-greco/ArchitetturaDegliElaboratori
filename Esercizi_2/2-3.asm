# Implementare un programma in linguaggio assembly MIPS che legga da input un intero e 
# calcoli il numero di 1 della sua rappresentazione binaria.
# Esempio
# INPUT: 521 (in binario 1000001001)
# OUTPUT:3

# 11111111111111111111111111111110 = > 4294967294
# 11111111111111111111111111111111 = > 4294967295

.text
.globl main
main:
#	Definisci $t9 a 0 come sommatore
	li $t9, 0
#	Definisci $t8 a 2 come divisore
	li $t8, 2

#	Stampa la stringa di input
	la $a0, str_input	
	li $v0, 4
	syscall

#	Acquisisci numero in input
	li $v0, 5
	syscall
	
	move $t0, $v0
WHILE:
#	Dividi il valore corrente per 2
	div $t0, $t8
	
	mfhi $t1
	mflo $t0
#	Controlla se il resto è 1
	beq $t1, 1, ADDV
CONDITION:
#	Controlla se è necessario terminare il ciclo
	blt $t0, 1, EXIT
	j WHILE
ADDV:
#	Incrementa sommatore
	add $t9, $t9, 1
	j CONDITION
	
EXIT: 
#	Stampa l'output e termina il programma
	la $a0, str_output
	li $v0, 4
	syscall 
	
	move $a0, $t9
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.data
str_input: .asciiz "INPUT: "
str_output: .asciiz "OUTPUT: "
n: .word 3