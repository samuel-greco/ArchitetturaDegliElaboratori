# Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo dividendo (word) 
#ed un intero positivo (word) divisore e restituisca in output il quoziente e resto della divisione a/b.
# Esempio
# INPUT (dividendo): 56
# INPUT (divisore): 23
# OUTPUT: Quoziente: 2 Resto:10

.eqv DIVISORE, $t9
.eqv DIVIDENDO, $t8
.eqv QUOZ, $t7
.eqv REMAINDER, $t6

.text
.globl main
main:

# Printa la stringa per l'input
	la $a0, str_dividendo
	li $v0, 4
	syscall

# Acquisisci input dividendo
	li $v0, 5
	syscall
	move DIVIDENDO, $v0
	
# Printa la sringa per l'input
	la $a0, str_divisore
	li $v0, 4
	syscall
	
# Acquisisci input divisore
	li $v0, 5
	syscall
	move DIVISORE, $v0

# Elabora dati 
	div DIVIDENDO, DIVISORE
	
	mfhi REMAINDER
	mflo QUOZ
	
	  
# Stampa output

	la $a0, str_quoziente
	li $v0, 4
	syscall
	
	move $a0, QUOZ
	li $v0, 1
	syscall
	
	
	la $a0, space
	li $v0, 4
	syscall
	
	la $a0, str_resto
	li $v0, 4
	syscall
	
	move $a0, REMAINDER
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.data
str_dividendo: .asciiz "INPUT (dividendo) : "
str_divisore: .asciiz "INPUT (divisore) : "
str_quoziente: .asciiz "Quoziente: "
str_resto: .asciiz "Resto: "
space: .asciiz " "