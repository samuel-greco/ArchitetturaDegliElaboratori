# Dato a intero positivo (da 0 a 255) inserito da tastiera, scrivere il valore binario di a al contrario Esempio
# INPUT (a): 5 (cioè 00000101)
# OUTPUT: 160 (10100000)
# INPUT (a): 105 (cioè 01101001)
# OUTPUT: 150 (10010110)

.eqv VALUE, $t0

.text
.globl main
main:
#	Acquisisci valore intero in input
	li $v0, 5
	syscall
	move VALUE, $v0 
	
#	Carica indirizzo in memoria
	la $t1, n
#	Memorizza il valore in memoria
	sb VALUE, ($t1)
	
	sll $t1, VALUE, 6
	
	
	
EXIT:	
#	Termine del programma
	li $v0, 10
	syscall 


.data
n: .byte 0