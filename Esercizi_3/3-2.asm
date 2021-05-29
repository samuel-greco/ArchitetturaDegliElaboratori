# Implementare un programma in linguaggio assembly MIPS che legga da input un intero positivo  a>2 (word)
# ed un intero  positivo (word) b>1 e ne restituisca in output il prodotto (axb) senza utilizzare l'istruzione mul.
# Esempio
# INPUT (a): 10
# INPUT (b): 5
# OUTPUT: 50

.eqv An, $t1
.eqv Bn, $t2
.eqv MIN, $t3
.eqv CONT, $t4
.eqv TEMP, $t6


.text 
.globl main


main: 
#	Leggi a
	li $v0, 5
	syscall
	move An, $v0

#	Controlla se a > 2
	ble An, 2, EXIT
		
#	Leggi b
	li $v0, 5
	syscall 
	move Bn, $v0
	
#	Controllo se b > 1
	ble Bn, 1, EXIT

		
#	I valori sono corretti quindi

#	Verifichiamo il numero più piccolo 
	bge An, Bn, SETB

#	Imposta a come numero minore
	move MIN, An
	move TEMP, Bn
	
#	Inizializzo contatore e registro t9	
	li CONT, 0
	li $t9, 0
FOR:
	bge CONT, MIN, PRINTOUTPUT
	add $t9, $t9, TEMP
	add CONT, CONT, 1
	j FOR

SETB:
#	Imposta b come numero minore
	move MIN, Bn
	move TEMP, An
	j FOR	
EXIT: 
#	Termina il programma
	li $v0, 10
	syscall

PRINTOUTPUT: 	
#	Stampa il prodotto dei due numeri 
	move $a0, $t9
	li $v0, 1
	syscall
	j EXIT
