# Implementare un programma in linguaggio assembly MIPS che dati cinque interi positivi definiti in memoria 
# calcola la media aritmetica
# Esempio
# INPUT: a=0,b=11;c=7;d=1982;e=10051980
# OUTPUT:2010796

.eqv INDICE, $t1
.eqv DIM, $t2
.eqv SOMMA, $t9
.text
.globl main
main:

	li INDICE, 0 
	lw DIM, lun_vettore
	li SOMMA, 0
FOR:
	mul $t3, INDICE, 4
	lw $t4, vettore($t3)
	
	add SOMMA, SOMMA, $t4
	
	add INDICE, INDICE, 1
	blt INDICE, DIM, FOR
	
	
	div SOMMA, DIM
	
	mflo $a0
	li $v0, 1
	syscall 
	
	li $v0, 10
	syscall
	

.data
spazio: .asciiz " "
vettore: .word 0, 11, 7, 1982, 10051980
lun_vettore: .word 5 